# CLAUDE.md — Clarity Design System

This file provides guidance for AI assistants working on the Clarity Design System repository.

---

## Project Overview

**Clarity** is VMware's open-source design system, consisting of:

- `@clr/ui` — CSS framework (compiled from SCSS)
- `@clr/icons` — Web component-based SVG icon library
- `@clr/angular` — Angular component library built on top of `@clr/ui`

This is a **monorepo** at version `1.0.5`, using **Angular 7**, **TypeScript 3.1.3**, and **Node.js 10.x**.

---

## Repository Structure

```
/
├── src/
│   ├── clr-angular/       # Angular component library (main library)
│   ├── clr-icons/         # Icon web component library
│   ├── website/           # Documentation website (Angular + SSR)
│   ├── dev/               # Dev demo app (local development playground)
│   ├── ks-app/            # Kitchen sink app (full component showcase)
│   └── schematics/        # Angular schematics for code generation
├── npm/                   # Package templates for npm distribution
├── tests/                 # Test utilities, TSLint rules, and configuration
├── scripts/               # Build, test, and automation scripts
├── golden/                # API signature baselines (clr-angular.d.ts)
├── gemini/                # Visual regression screenshots
├── dist/                  # Build output (generated, not committed)
├── angular.json           # Angular CLI workspace configuration
├── karma.conf.js          # Karma test runner config
├── tslint.json            # TSLint rules
├── .prettierrc            # Prettier formatting config
├── .stylelintrc           # Stylelint config for SCSS/CSS
├── .editorconfig          # Editor settings
├── .travis.yml            # CI configuration
└── netlify.toml           # Netlify deployment config
```

### `src/clr-angular/` Layout

Components are organized by category:

```
clr-angular/
├── button/
├── data/          # Datagrid, stack view, tree view
├── forms/
├── layout/        # Grid, main container, nav, sidenav, header
├── modal/
├── wizard/
├── popover/       # Dropdown, signpost, tooltip
├── progress/      # Progress bar, spinner
├── emphasis/      # Alert, badges, labels
├── icon/
├── image/
├── typography/
├── color/
├── utils/
├── index.ts           # Main entry
├── public_api.ts      # Public API exports
├── clr-angular.module.ts
├── main.scss
└── dark-theme.scss
```

---

## Environment Requirements

- **Node.js:** `>=10.9.0 <11.0.0` (strict — use nvm or similar)
- **npm:** `>=5.0.0`

Install dependencies:

```bash
npm install
```

---

## Development Commands

### Local Development

```bash
npm start              # Serve the dev app (light theme) at localhost:4200
npm run start:dark     # Serve dev app with dark theme
npm run start:ks-app   # Serve kitchen sink app
npm run website:start  # Serve the documentation website
```

### Building

```bash
npm run build          # Full build: ui, icons, angular, schematics, golden
npm run build:ui       # SCSS → CSS + autoprefixer + optimization
npm run build:icons    # Icon library (webpack + SVG + CSS)
npm run build:angular  # Angular library via ng-packagr
npm run clean          # Delete dist/
```

### Testing

```bash
npm test               # Unit tests (Karma/Jasmine, watch: false)
npm run test:watch     # Unit tests in watch mode
npm run test:format    # Check Prettier formatting
npm run test:lint      # Lint TypeScript and SCSS
npm run test:golden    # Validate public API signatures haven't changed
npm run test:aot       # AOT compilation check via ks-app prod build
npm run test:a11y      # Accessibility tests (axe-cli)
npm run test:visual    # Visual regression tests (Gemini, requires Docker)
npm run test:travis    # Full CI suite: format + lint + build + test + aot + golden
```

### Fixing / Auto-formatting

```bash
npm run format:fix     # Run Prettier on staged files (also run by pre-commit hook)
npm run lint:fix       # Auto-fix TSLint and Stylelint issues
npm run golden:fix     # Regenerate API golden file after intentional public API changes
npm run visual:fix     # Update visual regression baselines
```

---

## Code Conventions

### File Naming

| Type | Convention | Example |
|------|-----------|---------|
| Component / Directive | No suffix, in module folder | `datagrid-row.ts` |
| Service / Provider / Factory | `.service.ts` suffix | `wizard-navigation.service.ts` |
| Interface / Abstract class | `.interface.ts` suffix | `datagrid-state.interface.ts` |
| Enum | `.enum.ts` suffix | `sort-order.enum.ts` |
| Spec/test | `.spec.ts` suffix | `datagrid-row.spec.ts` |

Multi-file components (3+ services, interfaces, or enums) use subfolders:
- `providers/` for services
- `interfaces/` for interfaces
- `enums/` for enums

### TypeScript Naming

| Construct | Convention | Example |
|-----------|-----------|---------|
| Public class | `Clr` prefix + PascalCase | `ClrDatagridRow` |
| Public constant | `CLR_` prefix + SCREAMING_SNAKE_CASE | `CLR_SORT_ORDER` |
| Internal constant | SCREAMING_SNAKE_CASE | `DEFAULT_PAGE_SIZE` |
| Enum (public) | `Clr` prefix + PascalCase | `ClrDirection` |
| Enum value | SCREAMING_SNAKE_CASE | `ClrDirection.DOWN` |
| Private property | No `_` prefix (unlike common convention) | `this.open` not `this._open` |
| SCSS variable | `$clr-` prefix + kebab-case | `$clr-color-primary` |

- Prefer full words over abbreviations
- Anything in the public API **must** have the `clr` / `Clr` / `CLR_` prefix
- Do **not** prefix private properties with `_`

### TypeScript Rules (TSLint)

- Triple equals (`===`) always required
- No `eval` or `eval`-like operations (`Function()`, `setTimeout(string)`)
- No `console.debug`, `console.info`, `console.time`, `console.trace`
- No barrel imports (importing from `index.ts` directly)
- Files must include the VMware copyright header
- Prefer `const` and `for...of` loops
- No `fdescribe` / `fit` (defocus rule — prevents focused tests from being committed)

### Formatting (Prettier)

- Print width: **120 characters**
- Indent: **2 spaces**
- Quotes: **single**
- Trailing commas: **es5**
- Arrow parens: **avoid** (when single arg, no parens)
- Semicolons: **always**

Pre-commit hook runs `prettier --staged` automatically via Husky.

### SCSS / CSS

- Stylelint extends `stylelint-config-recommended`
- SCSS variables use `$clr-` prefix and kebab-case
- PostCSS + Autoprefixer applied on all output CSS

---

## TypeScript Path Aliases

Defined in `tsconfig.json` for local development (resolves to source, not `dist/`):

```
@clr/angular       → src/clr-angular
@clr/icons         → src/clr-icons
@clr/icons/shapes/ → src/clr-icons/shapes/
```

---

## Public API Management

The public API of `@clr/angular` is tracked via golden files:

- Baseline: `golden/clr-angular.d.ts`
- Generated: `dist/golden/clr-angular.d.ts`

**When making intentional public API changes:**
1. Run `npm run golden:fix` to regenerate the golden file
2. Commit the updated `golden/clr-angular.d.ts`

**CI will fail** if the generated API differs from the golden file.

---

## Testing Details

### Unit Tests

- Framework: **Karma + Jasmine**
- Entry: `tests/tests.entry.ts`
- Config: `karma.conf.js`
- Coverage via `karma-coverage-istanbul-reporter`
- Cross-browser: Sauce Labs (configured via env vars in CI)

### Visual Regression Tests

- Tool: **Gemini 5.9.1** (requires Docker)
- Config: `.gemini.conf.yml`
- Screenshots: `gemini/`
- Run: `npm run test:visual [set1|set2|set3|set4]`
- Fix: `npm run visual:fix`

### Accessibility Tests

- Tool: **axe-cli 3.0.0**
- Run: `npm run test:a11y`

---

## CI/CD

### Travis CI

Triggers on all branches and pull requests. Two job types:

| Job | What It Does |
|-----|-------------|
| `test:travis` | Format, lint, unit tests, build, AOT check, API golden diff |
| `test:visual set1-4` | Parallelized visual regression (requires Docker) |

Auto-publishes to npm on successful `master` builds.

### Netlify

- Deploys the documentation website
- Build: `npm run website:prerender`
- Output: `dist/website/browser/`
- Includes Netlify Lambda functions from `scripts/netlify/`

---

## Publishing Packages

Three packages are published from `dist/`:

```bash
npm run publish:latest  # stable release
npm run publish:alpha   # alpha tag
npm run publish:beta    # beta tag
npm run publish:rc      # release candidate
npm run publish:next    # next tag
npm run publish:local   # local Verdaccio registry
```

---

## Key Architectural Notes

1. **Three packages, one repo.** `@clr/ui`, `@clr/icons`, `@clr/angular` are built independently and published separately. `@clr/angular` depends on `@clr/ui` CSS at runtime.

2. **ng-packagr for Angular packaging.** The Angular library build uses ng-packagr (`ng build clr-angular`), configured in `src/clr-angular/ng-package.json`.

3. **Icon library is a web component.** `@clr/icons` uses the Custom Elements API (W3C web components), not Angular, so it can be used framework-agnostically.

4. **Dark theme is a separate CSS build.** `clr-ui-dark.css` is produced alongside `clr-ui.css`. The dev app and Angular builds support a `dark` configuration in `angular.json`.

5. **Website uses Angular Universal (SSR).** The documentation site is pre-rendered for static hosting on Netlify via `npm run website:prerender`.

6. **Deprecated grid layout.** A separate `clr-grid-deprecated.css` is maintained for backward compatibility.

7. **`save-exact=true` in `.npmrc`.** All dependency versions are pinned exactly — do not use `^` or `~` in `package.json`.

---

## Do's and Don'ts for AI Assistants

**Do:**
- Read `CODING_GUIDELINES.md` for detailed naming and structure rules
- Read `DEVELOPMENT_CONTRIBUTION.md` before making non-trivial changes
- Run `npm run test:format` and `npm run test:lint` before committing
- Update `golden/clr-angular.d.ts` (via `npm run golden:fix`) when changing the public API
- Prefix all public exports with `clr`, `Clr`, or `CLR_`
- Use 2-space indentation and 120-character line width

**Don't:**
- Commit `fdescribe` or `fit` (focused tests) — the TSLint `defocus` rule will catch this
- Use barrel imports (`import ... from './index'`)
- Prefix private class members with `_`
- Modify `dist/` — it is generated output
- Use `console.debug`, `console.info`, `console.time`, or `console.trace`
- Add `^` or `~` version ranges to `package.json` — exact versions only
- Push to `master` directly; use pull requests

---

## Reference Documents

| File | Purpose |
|------|---------|
| `CODING_GUIDELINES.md` | Naming, file structure, and code style rules |
| `CONTRIBUTING.md` | Contribution process overview |
| `DEVELOPMENT_CONTRIBUTION.md` | Detailed dev contribution workflow |
| `BUILD.md` | Detailed build process per package |
| `CODE_OF_CONDUCT.md` | Community standards |
