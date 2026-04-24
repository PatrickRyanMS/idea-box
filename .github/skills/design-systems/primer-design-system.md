# Skill: GitHub Primer Design System

Procedural knowledge for designing UI comps that follow **GitHub's Primer Design System**. Use this skill when the user explicitly requests Primer-style designs, or during blue-sky ideation when Primer is a relevant design direction.

**Canonical source**: https://primer.style/

This skill synthesizes the Primer design language: design philosophy, color, typography, spacing, elevation, shapes, iconography, interaction states, and tokens.

---

## Design Philosophy

Primer is **built for GitHub** — a developer-focused interface system that prioritizes:

1. **Clarity** — Content-first design. UI recedes so code, issues, and discussions take center stage.
2. **Reliability** — Consistent, predictable patterns across all of GitHub's surfaces.
3. **Accessibility** — Industry-leading 9 themes including colorblind and tritanopia-specific variants.

Primer serves **developers** — people who read code, review PRs, manage issues, and collaborate on repositories.

---

## Color

### 3-Tier Token Architecture

| Tier | Description | Example |
|------|-------------|---------|
| **Base colors** | Raw palette — named by hue | `--color-scale-blue-5` |
| **Functional tokens** | Semantic purpose — named by role | `--color-accent-fg` |
| **Component tokens** | Scoped to specific components | `--color-btn-primary-bg` |

Always use **functional tokens** in comps — never base colors directly.

### 9 Themes

| Theme | Description |
|-------|-------------|
| **Light** | Default light theme |
| **Light High Contrast** | Enhanced contrast light |
| **Light Colorblind** | Deuteranopia/protanopia-safe light |
| **Light Tritanopia** | Tritanopia-safe light |
| **Dark** | Default dark theme |
| **Dark High Contrast** | Enhanced contrast dark |
| **Dark Colorblind** | Deuteranopia/protanopia-safe dark |
| **Dark Tritanopia** | Tritanopia-safe dark |
| **Dark Dimmed** | Reduced brightness dark (easier on eyes) |

### Neutral Scale

**14 steps** (0–13) — more granular than the typical 10-step scale:
- `neutral-0` = `#ffffff` (white)
- `neutral-1` = `#f6f8fa` (lightest gray)
- `neutral-13` = `#010409` (near-black)

### Functional Color Roles

| Role | Purpose |
|------|---------|
| **accent** | Primary interactive color (blue) |
| **success** | Positive states (green) |
| **danger** | Error/destructive states (red) |
| **warning** | Caution states (yellow) |
| **attention** | Needs-attention states (yellow/orange) |
| **done** | Completed states (purple) |
| **sponsor** | Sponsorship/heart (pink) |
| **open** | Open PRs/issues (green) |
| **closed** | Closed PRs/issues (red) |

Each role has `-fg` (foreground), `-muted` (subtle), and `-emphasis` (bold) variants.

### Base Color Palette (Light Theme)

| Color | Shade 5 |
|-------|---------|
| Blue | `#0969da` |
| Green | `#1a7f37` |
| Red | `#cf222e` |
| Yellow | `#9a6700` |
| Purple | `#8250df` |
| Pink | `#bf3989` |
| Coral | `#c4432b` |
| Orange | `#bc4c00` |

### In Comps

```css
:root {
    /* Functional tokens — light theme */
    --color-fg-default: #1f2328;
    --color-fg-muted: #656d76;
    --color-fg-subtle: #6e7781;
    --color-canvas-default: #ffffff;
    --color-canvas-subtle: #f6f8fa;
    --color-border-default: #d0d7de;
    --color-border-muted: rgba(208, 215, 222, 0.7);
    --color-accent-fg: #0969da;
    --color-accent-emphasis: #0550ae;
    --color-success-fg: #1a7f37;
    --color-danger-fg: #cf222e;
    --color-attention-fg: #9a6700;
    --color-done-fg: #8250df;
    --color-sponsor-fg: #bf3989;
}
```

---

## Typography

### Font Stack

System fonts — no custom typeface:

```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';
```

Monospace for code:
```css
font-family: ui-monospace, SFMono-Regular, 'SF Mono', Menlo, Consolas, 'Liberation Mono', monospace;
```

### Units

All typography uses **rem** — never px.

### 4px Grid

All line heights align to a **4px vertical grid**.

### Type Tokens

Primer provides shorthand type tokens for common patterns rather than a numbered type scale. Sizes are defined via `@primer/primitives`.

### Styling Rules

- Use system fonts — no custom font loading
- rem-based sizing for accessibility (respects browser font size settings)
- Hierarchy through size/weight contrast — not color alone
- Monospace for all code contexts (inline code, code blocks, diffs)

---

## Spacing

### Base Unit

**4px grid**. All spacing is a multiple of 4px.

### Spacing Rules

- Use spacing primitives from `@primer/primitives`
- Consistent 4px-grid alignment creates the clean, dense layout that defines GitHub's UI
- Tighter spacing for data-dense views (issue lists, file trees), more generous for content (readmes, discussions)

---

## Layout

### Viewport Ranges

| Range | Description |
|-------|-------------|
| **Narrow** | Mobile/small screens |
| **Regular** | Default desktop |
| **Wide** | Large screens |

### Page Types

| Type | Structure |
|------|-----------|
| **Full** | Single content area (repository file view, readme) |
| **Split** | Sidebar + content (issue detail, PR review) |
| **Interstitial** | Focused task overlay (new repo, settings) |

### Page Anatomy

- **Header**: Global navigation bar (always present)
- **Context Region**: Breadcrumbs, tabs, repository nav
- **Content**: Main content area
- **Footer**: Page footer

### Responsive Behavior

- Responsive padding and margins per viewport range
- Content stacking on narrow viewports
- Sidebar collapse on narrow viewports

---

## Elevation

Primer uses **background color differentiation and subtle borders** for depth rather than prominent shadows. The system is intentionally flat.

| Depth Level | Mechanism |
|------------|-----------|
| **Recessed** | `--color-canvas-inset` — slightly darker than default |
| **Default** | `--color-canvas-default` — base surface |
| **Raised** | `--color-canvas-subtle` + border | Cards, containers |
| **Overlay** | `--color-canvas-overlay` + `--color-shadow-*` | Dropdowns, modals |

### Shadow Tokens

`--color-shadow-*` tokens exist in `@primer/primitives` for overlay elements. Shadows are minimal and used sparingly.

### In Comps

```css
.surface         { background: var(--color-canvas-default); }
.surface-inset   { background: var(--color-canvas-inset); }
.surface-subtle  { background: var(--color-canvas-subtle); }
.overlay         {
    background: var(--color-canvas-overlay);
    box-shadow: 0 1px 3px rgba(27,31,36,0.12), 0 8px 24px rgba(66,74,83,0.12);
    border: 1px solid var(--color-border-default);
}
```

---

## Shapes

### Corner Radius

Border radius tokens are available in `@primer/primitives`. Consistent radii per component type — Primer uses moderate rounding, never sharp (0px) or heavy (16px+) by default.

General pattern:
- Small elements (labels, tokens): Small radius (~3–4px)
- Standard components (buttons, inputs): Medium radius (~6px)
- Containers (cards, dialogs): Same or slightly larger

---

## Iconography

### Octicons

- GitHub's open-source SVG icon set
- **Two sizes**: 16px and 24px
- Packages: `@primer/octicons`, `@primer/octicons-react`, `@primer/styled-octicons`

### Icon Rules

- Use 16px for inline/compact UI (issue lists, file trees)
- Use 24px for prominent actions and navigation
- Match icon color to `--color-fg-default` or `--color-fg-muted`
- Developer-specific icons (git-branch, git-commit, git-pull-request, code, terminal) are first-class citizens

---

## Interaction States

Managed via functional color tokens that shift per theme:

| State | Treatment |
|-------|-----------|
| **Hover** | Background shifts to hover token variant |
| **Active** | Deeper background shift |
| **Focus** | Blue outline ring (`--color-accent-fg`) |
| **Selected** | Accent background tint |
| **Disabled** | Muted colors, no interaction |

### In Comps

```css
.interactive       { color: var(--color-fg-default); background: var(--color-canvas-default); }
.interactive:hover { background: var(--color-canvas-subtle); }
.interactive:focus-visible {
    outline: 2px solid var(--color-accent-fg);
    outline-offset: -2px;
}
.interactive:disabled {
    color: var(--color-fg-muted);
    pointer-events: none;
}
```

---

## Design Tokens

### Token Packages

| Package | Contents |
|---------|----------|
| `@primer/primitives` | Design tokens (CSS custom properties + JSON) |
| `@primer/css` | Utility CSS classes |
| `@primer/react` | React components |
| `@primer/view-components` | Rails ViewComponents |
| `@primer/octicons` | Icon set |

### Token Format

- CSS custom properties: `--color-{role}-{element}-{variant}`
- Also available as JSON via `@primer/primitives`
- Tokens are the source of truth — all 9 themes resolve through the same token names

---

## Applying Primer in Comps

When building comps with Primer principles, follow this checklist:

### Must-Have

- [ ] Use system font stack — no custom font loading
- [ ] Use rem-based typography — never px for font sizes
- [ ] Use functional color tokens (`--color-accent-fg`, `--color-danger-fg`, etc.) — never base palette colors
- [ ] Use 4px grid for all spacing
- [ ] Flat design with subtle borders — shadows only for overlays
- [ ] Focus ring: 2px solid `--color-accent-fg` on keyboard focus
- [ ] Support `prefers-reduced-motion`
- [ ] Monospace font for all code contexts

### Should-Have

- [ ] Responsive viewport ranges (narrow/regular/wide)
- [ ] Canvas color tokens for surface hierarchy (`default`, `subtle`, `inset`, `overlay`)
- [ ] Hover/active/focus/disabled states on all interactive elements
- [ ] 16px Octicons for inline UI, 24px for prominent actions
- [ ] Split page layout for detail views (sidebar + content)

### Nice-to-Have

- [ ] Support for multiple themes via CSS custom property swapping (9 themes available)
- [ ] Colorblind-safe functional tokens (done, open, closed role distinction)
- [ ] Domain-specific color roles (sponsor pink, done purple, open green, closed red)
- [ ] Inset focus ring (`outline-offset: -2px`) — Primer's signature focus style
