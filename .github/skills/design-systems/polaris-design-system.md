# Skill: Shopify Polaris Design System

Procedural knowledge for designing UI comps that follow **Shopify's Polaris Design System**. Use this skill when the user explicitly requests Polaris-style designs, or during blue-sky ideation when Polaris is a relevant design direction.

**Canonical source**: https://polaris.shopify.com/

This skill synthesizes the Polaris design language: design philosophy, color, typography, spacing, elevation, shapes, motion, iconography, interaction states, and tokens.

---

## Design Philosophy

Polaris is **designed for commerce**. Three color principles define its visual identity:

1. **Color has purpose** — Color is exclusively semantic. The UI itself is monochromatic (black/white/gray); color only appears for status, feedback, and emphasis.
2. **Color has impact** — Because color is rare, it commands attention. Every colored element carries meaning.
3. **Color is accessible** — Contrast and legibility are built into the token system.

Polaris serves **merchants** — business owners managing products, orders, and customers in Shopify's admin.

---

## Color

### Monochromatic Base

Polaris uses a **black-and-white neutral backdrop** with purposeful color pops. The UI chrome is grayscale; color signals meaning.

### Token Prefix

All color tokens use `--p-color-*`.

### Background Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--p-color-bg-surface` | `rgba(255,255,255,1)` | Default surface |
| `--p-color-bg-surface-secondary` | Slightly off-white | Secondary areas |
| `--p-color-bg-surface-hover` | Light gray | Surface hover state |
| `--p-color-bg-surface-active` | Darker gray | Surface active state |
| `--p-color-bg-surface-selected` | Blue tint | Selected items |
| `--p-color-bg-surface-disabled` | Light gray | Disabled surfaces |

### Fill Tokens (Smaller Elements)

| Token | Value | Usage |
|-------|-------|-------|
| `--p-color-bg-fill` | Dark gray | Standard fills |
| `--p-color-bg-fill-brand` | `rgba(48,48,48,1)` | Primary buttons (dark fill) |
| `--p-color-bg-fill-success` | Green | Success states |
| `--p-color-bg-fill-caution` | Yellow | Caution states |
| `--p-color-bg-fill-warning` | Orange | Warning states |
| `--p-color-bg-fill-critical` | Red | Error/critical states |
| `--p-color-bg-fill-info` | Blue | Informational states |
| `--p-color-bg-fill-emphasis` | Blue | Emphasis/accent |
| `--p-color-bg-fill-magic` | Purple | AI-suggested elements |
| `--p-color-bg-fill-transparent` | Transparent | Ghost buttons |

### Text Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--p-color-text` | `rgba(48,48,48,1)` | Primary text |
| `--p-color-text-secondary` | `rgba(97,97,97,1)` | Secondary text |
| `--p-color-text-disabled` | Light gray | Disabled text |
| `--p-color-text-link` | `rgba(0,91,211,1)` | Links |
| `--p-color-text-success` | Green | Success messages |
| `--p-color-text-caution` | Yellow | Caution text |
| `--p-color-text-warning` | Orange | Warning text |
| `--p-color-text-critical` | Red | Error text |
| `--p-color-text-magic` | Purple | AI-related text |

### "On" Tokens

Paired text/icon colors for specific fill backgrounds: `--p-color-text-brand-on-bg-fill`, `--p-color-text-info-on-bg-fill`, etc.

### "Magic" AI Tokens

Polaris includes a **first-class design token role for AI-suggested content**:
- `--p-color-bg-surface-magic` / `--p-color-bg-fill-magic`
- `--p-color-text-magic` / `--p-color-border-magic`
- `--p-color-icon-magic`

Use these for any element that represents AI-generated or AI-suggested content.

### Border Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--p-color-border` | `rgba(227,227,227,1)` | Default borders |
| `--p-color-border-hover` | Darker gray | Hovered borders |
| `--p-color-border-focus` | `rgba(0,91,211,1)` | Focused elements |
| `--p-color-border-critical` | Red | Error borders |

### In Comps

```css
:root {
    --p-color-bg-surface: rgba(255, 255, 255, 1);
    --p-color-bg-fill-brand: rgba(48, 48, 48, 1);
    --p-color-text: rgba(48, 48, 48, 1);
    --p-color-text-secondary: rgba(97, 97, 97, 1);
    --p-color-text-link: rgba(0, 91, 211, 1);
    --p-color-border: rgba(227, 227, 227, 1);
    --p-color-border-focus: rgba(0, 91, 211, 1);
    --p-color-bg-fill-success: #22a06b;
    --p-color-bg-fill-critical: #d82c0d;
    --p-color-bg-fill-warning: #ffc453;
    --p-color-bg-fill-magic: #7c59e4;
}
```

---

## Typography

### Font Stack

- **Primary**: Inter (open-source variable font)
- **Mono**: System monospace for code
- **Fallback**: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`

### Type Scales

Polaris uses two scales — **Heading** and **Body** — both aligned to a 4px vertical grid.

### Token Prefix

`--p-font-*` for font families and weights; `--p-text-*` for text style presets.

### Styling Rules

- Use Inter as the primary typeface — load from Google Fonts or self-host
- All line heights align to the 4px grid
- Use tabular numbers for currency and data columns
- UI-first type scale — optimized for high-density software layouts

---

## Spacing

### Token Prefix

`--p-space-*`

### Base Unit

**4px grid** alignment for all spacing.

### Spacing Rules

- Use space tokens for all margins, padding, and gaps
- Never use arbitrary pixel values
- Consistent spacing creates the clean, grid-aligned look that defines Polaris

---

## Elevation

### Philosophy

Depth indicates **hierarchy, interactivity, and focus**. Higher Z = more important.

### Shadow Tokens

`--p-shadow-*` category — available via the Polaris tokens package.

### Depth Rules

- **Interactive elements** (buttons) use a push-down effect on press
- **Static elements** should not have depth/shadow
- **Elements must not protrude** outside their parent container
- **Backdrop**: `--p-color-backdrop-bg` = `rgba(0,0,0,0.71)` for modal overlays

### In Comps

```css
.card    { box-shadow: var(--p-shadow-card); }
.popover { box-shadow: var(--p-shadow-popover); }
.modal   { box-shadow: var(--p-shadow-modal); }
.scrim   { background: rgba(0, 0, 0, 0.71); }
```

---

## Shapes

### Border Tokens

`--p-border-*` category for border-radius and border-width values.

### General Pattern

- Small interactive elements: Small radius
- Standard components (buttons, inputs): Medium radius
- Large containers (cards, modals): Larger radius
- Pills/tags: Full radius

---

## Motion

### Principles

1. **Purposeful** — Motion enhances understanding, never decorates
2. **Responsive** — Immediate feedback matching the scale of the action
3. **Snappy** — Starts rapidly, slows at end. Never abrupt, never sluggish.

### Token Prefix

`--p-motion-*`

### Easing

"Snappy" = fast start, gradual slow-down (ease-out style). This is the default for all Polaris transitions.

### In Comps

```css
.element-enter {
    transition: opacity 200ms ease-out, transform 200ms ease-out;
}

@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}
```

---

## Iconography

### Polaris Icons

- **400+ icons** focused on commerce and entrepreneurship
- SVG-based
- Categories include: navigation, actions, objects (products, orders, customers), status

### Icon Rules

- Match icon color to surrounding text token
- Use icons to reinforce meaning alongside text — not as standalone labels without accessible names
- Commerce-specific icons (shopping bag, storefront, receipt) are first-class citizens

---

## Interaction States

Polaris provides comprehensive `-hover`, `-active`, `-selected`, `-disabled` token variants for every color role.

| State | Treatment |
|-------|-----------|
| **Hover** | `-hover` suffix on bg/border tokens |
| **Active** | `-active` suffix — deeper shift |
| **Selected** | `-selected` suffix — blue tint background |
| **Focus** | `--p-color-border-focus` = `rgba(0,91,211,1)` |
| **Disabled** | `-disabled` suffix — reduced opacity, no interaction |

### In Comps

```css
.interactive       { background: var(--p-color-bg-surface); }
.interactive:hover { background: var(--p-color-bg-surface-hover); }
.interactive:active { background: var(--p-color-bg-surface-active); }
.interactive:focus-visible {
    outline: 2px solid var(--p-color-border-focus);
    outline-offset: 2px;
}
.interactive:disabled {
    background: var(--p-color-bg-surface-disabled);
    color: var(--p-color-text-disabled);
    pointer-events: none;
}
```

---

## Design Tokens

### Token Format

- CSS custom properties with `--p-*` prefix
- Available via `@shopify/polaris-tokens` npm package

### Token Categories

| Category | Prefix | Contents |
|----------|--------|----------|
| Border | `--p-border-*` | Radius, width |
| Breakpoints | `--p-breakpoints-*` | Responsive breakpoints |
| Color | `--p-color-*` | All color roles |
| Font | `--p-font-*` | Font families, weights |
| Height | `--p-height-*` | Component heights |
| Motion | `--p-motion-*` | Duration, easing |
| Shadow | `--p-shadow-*` | Elevation shadows |
| Space | `--p-space-*` | Spacing scale |
| Text | `--p-text-*` | Text style presets |
| Width | `--p-width-*` | Component widths |
| Z-Index | `--p-z-index-*` | Stacking order |

---

## Applying Polaris in Comps

When building comps with Polaris principles, follow this checklist:

### Must-Have

- [ ] Use Inter as the primary typeface
- [ ] Use a monochromatic (black/white/gray) base UI — color only for status and emphasis
- [ ] Use the `--p-color-*` token system — semantic roles, not raw hex
- [ ] Use the `--p-space-*` tokens — 4px grid alignment
- [ ] Implement hover/active/focus/disabled states using `-hover`, `-active`, `-disabled` token suffixes
- [ ] Focus ring: 2px solid `--p-color-border-focus` on keyboard focus
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] "Snappy" motion (fast start, slow end — ease-out)
- [ ] Shadow tokens for cards, popovers, and modals
- [ ] Push-down effect on button press
- [ ] Responsive breakpoints via Polaris breakpoint tokens
- [ ] Backdrop overlay (`rgba(0,0,0,0.71)`) for modal dialogs

### Nice-to-Have

- [ ] "Magic" AI tokens (purple) for AI-suggested content
- [ ] Tabular numbers for currency and data alignment
- [ ] Commerce-specific patterns (index tables, resource lists)
- [ ] "On" color tokens for text on specific fill backgrounds
