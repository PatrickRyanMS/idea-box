# Skill: IBM Carbon Design System

Procedural knowledge for designing UI comps that follow the **IBM Carbon Design System**. Use this skill when the user explicitly requests Carbon-style designs, or during blue-sky ideation when Carbon is a relevant design direction.

**Canonical source**: https://carbondesignsystem.com/

This skill synthesizes the Carbon design language pillars: design philosophy, color, typography, spacing, layout, elevation, motion, iconography, interaction states, and tokens.

---

## Design Philosophy

Carbon is built on IBM Design Language with a **Productive / Expressive duality** that runs through every foundation:

- **Productive**: Compact, efficient, focused. For data-heavy product UI where density and speed matter.
- **Expressive**: Dramatic, editorial, impactful. For marketing, onboarding, and storytelling moments.

Both modes share the same token architecture but resolve to different values (type sizes, motion curves, spacing).

---

## Color

### 4 Themes

| Theme | Background | Usage |
|-------|-----------|-------|
| **White** | `#ffffff` | Default light theme |
| **Gray 10** | `#f4f4f4` | Alternate light theme |
| **Gray 90** | `#262626` | Dark theme |
| **Gray 100** | `#161616` | Alternate dark theme (deepest) |

### Layering Model

Carbon uses **color layering** for depth instead of shadows:
- **Light themes**: Alternate White ↔ Gray 10 per layer
- **Dark themes**: Step lighter per layer (Gray 100 → 90 → 80 → 70)

### Primary Action Color

- Core Blue family. **Blue 60** = `#0f62fe` is the primary interactive color in light themes.

### Token Architecture

Role-based tokens — always use tokens, never raw hex:

| Category | Example Tokens |
|----------|---------------|
| **Backgrounds** | `$background`, `$layer`, `$layer-02`, `$layer-03` |
| **Text** | `$text-primary`, `$text-secondary`, `$text-placeholder`, `$text-disabled` |
| **Interactive** | `$interactive`, `$link-primary`, `$link-secondary` |
| **Fields** | `$field`, `$field-02`, `$field-03` |
| **Borders** | `$border-subtle`, `$border-strong`, `$border-interactive` |
| **Support** | `$support-error`, `$support-success`, `$support-warning`, `$support-info` |
| **Focus** | `$focus` (Blue 60 light / White dark), `$focus-inset` |
| **Overlay** | `$overlay` |

### Interaction Color Suffixes

| Suffix | Shift | Usage |
|--------|-------|-------|
| `-hover` | Half-step on IBM palette | Cursor enters element |
| `-active` | Two full steps | Click/tap down |
| `-selected` | One full step | Toggled on |
| `-disabled` | Gray family, low contrast | Not interactive |

### Accessibility Rules

- Use role-based tokens — they guarantee accessible contrast per theme
- Support all 4 themes — tokens resolve automatically
- `$focus` provides a 2px border for keyboard focus; `$focus-inset` adds an inner contrast ring
- `$inverse` tokens exist for light-on-dark or dark-on-light moments (e.g., tooltips)

### In Comps

```css
:root {
    --cds-background: #ffffff;
    --cds-layer: #f4f4f4;
    --cds-text-primary: #161616;
    --cds-text-secondary: #525252;
    --cds-interactive: #0f62fe;
    --cds-support-error: #da1e28;
    --cds-support-success: #198038;
    --cds-support-warning: #f1c21b;
    --cds-support-info: #0043ce;
    --cds-focus: #0f62fe;
    --cds-border-subtle: #e0e0e0;
    --cds-overlay: rgba(22, 22, 22, 0.5);
}
```

---

## Typography

### Font Stack

- **Sans**: `'IBM Plex Sans', 'Helvetica Neue', Arial, sans-serif`
- **Serif**: `'IBM Plex Serif', 'Georgia', Times, serif`
- **Mono**: `'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Courier, monospace`

IBM Plex is open-source and purpose-built for Carbon. Always use Plex Sans as the primary typeface.

### Type Scale

17 sizes from 12px to 92px. The scale follows the formula: `Xn = Xn−1 + {INT[(n−2)/4] + 1} × 2` starting at 12px:

12, 14, 16, 18, 20, 24, 28, 32, 36, 42, 48, 54, 60, 68, 76, 84, 92

### Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Light | 300 | Display text, large headings |
| Regular | 400 | Body text, UI labels |
| SemiBold | 600 | Emphasis, buttons, strong headings |

### Type Sets

| Set | Suffix | Character | Usage |
|-----|--------|-----------|-------|
| **Productive** | `-01` | Fixed headings, compact | Product UI, data-dense layouts |
| **Expressive** | `-02` | Responsive headings, dramatic | Marketing, editorial, onboarding |

### Styling Rules

- Use IBM Plex Sans as the default — Plex Mono for code, Plex Serif sparingly for editorial
- Choose Productive (`-01`) or Expressive (`-02`) type set and apply consistently within a context
- Use the type scale — don't invent arbitrary sizes

---

## Layout

### 2x Grid

Carbon's grid philosophy: **divide or multiply by two**.

- **Mini unit**: 8px base unit
- **Fixed sizing scale**: 8, 16, 24, 32, 48, 64, 80px (1×–10× mini units)

### Breakpoints

| Name | Width | Columns | Gutter | Margin |
|------|-------|---------|--------|--------|
| **Small** | 320px | 4 | 0px | 16px |
| **Medium** | 672px | 8 | 16px | 16px |
| **Large** | 1056px | 16 | 16px | 16px |
| **X-Large** | 1312px | 16 | 16px | 16px |
| **Max** | 1584px | 16 | 16px | 24px |

### Spacing Scale

13 tokens:

| Token | Size |
|-------|------|
| `$spacing-01` | 2px (0.125rem) |
| `$spacing-02` | 4px (0.25rem) |
| `$spacing-03` | 8px (0.5rem) |
| `$spacing-04` | 12px (0.75rem) |
| `$spacing-05` | 16px (1rem) |
| `$spacing-06` | 24px (1.5rem) |
| `$spacing-07` | 32px (2rem) |
| `$spacing-08` | 40px (2.5rem) |
| `$spacing-09` | 48px (3rem) |
| `$spacing-10` | 64px (4rem) |
| `$spacing-11` | 80px (5rem) |
| `$spacing-12` | 96px (6rem) |
| `$spacing-13` | 160px (10rem) |

### Grid Types

- **Fluid**: Columns stretch to fill available space
- **Fixed**: Columns have fixed widths
- **Hybrid**: Mix of fluid and fixed columns

### Aspect Ratios

Supported: 1:1, 2:1, 2:3, 3:2, 4:3, 16:9

---

## Elevation

Carbon does **not** use numbered elevation levels or shadow ramps. Depth is communicated through the **layering model** — stacking surfaces with progressively different background colors.

| Token | Purpose |
|-------|---------|
| `$layer` | First layer above background |
| `$layer-02` | Second layer |
| `$layer-03` | Third layer |

Light themes alternate White ↔ Gray 10. Dark themes step lighter (Gray 100 → 90 → 80 → 70).

### In Comps

```css
.page       { background: var(--cds-background); }       /* White */
.card       { background: var(--cds-layer); }             /* Gray 10 */
.popover    { background: var(--cds-layer-02); }          /* White */
.nested     { background: var(--cds-layer-03); }          /* Gray 10 */
```

Use color differentiation, not box-shadow, for depth. Shadows are used sparingly (e.g., dropdown menus) but are not a primary depth mechanism.

---

## Shapes

Carbon does not publish a formal corner radius scale. Components use consistent but component-specific radius values. General pattern:

- Small interactive elements (checkboxes, tags): 0–2px
- Standard components (buttons, inputs, dropdowns): 0px (sharp corners are a Carbon signature)
- Larger containers (tiles, modals): 0px

**Carbon's signature is sharp, squared-off corners** — this is a key visual differentiator from other design systems.

---

## Motion

### Productive vs Expressive

Motion follows the same duality as typography:
- **Productive**: Efficient, subtle — for product UI
- **Expressive**: Vibrant, enthusiastic — for editorial/marketing

### Easing Curves

| Curve | CSS Value | Usage |
|-------|-----------|-------|
| Standard Productive | `cubic-bezier(0.2, 0, 0.38, 0.9)` | Default product UI transitions |
| Standard Expressive | `cubic-bezier(0.4, 0.14, 0.3, 1)` | Editorial/marketing transitions |
| Entrance Productive | `cubic-bezier(0, 0, 0.38, 0.9)` | Elements entering in product UI |
| Entrance Expressive | `cubic-bezier(0, 0, 0.3, 1)` | Elements entering in editorial |
| Exit Productive | `cubic-bezier(0.2, 0, 1, 0.9)` | Elements leaving in product UI |
| Exit Expressive | `cubic-bezier(0.4, 0.14, 1, 1)` | Elements leaving in editorial |

### Duration Tokens

| Token | Duration | Usage |
|-------|----------|-------|
| `duration-fast-01` | 70ms | Button/toggle micro-interactions |
| `duration-fast-02` | 110ms | Fades |
| `duration-moderate-01` | 150ms | Small expansion, short movements |
| `duration-moderate-02` | 240ms | Expansion, toast appearance |
| `duration-slow-01` | 400ms | Large expansion, system notifications |
| `duration-slow-02` | 700ms | Background dimming |

### Accessibility

- Respect `prefers-reduced-motion` — disable or minimize all animation
- Keep productive motion subtle and fast
- Use longer durations only for expressive contexts

### In Comps

```css
/* Productive entrance */
.element-enter {
    transition: opacity 150ms cubic-bezier(0, 0, 0.38, 0.9),
                transform 150ms cubic-bezier(0, 0, 0.38, 0.9);
}

/* Expressive entrance */
.hero-enter {
    transition: opacity 240ms cubic-bezier(0, 0, 0.3, 1),
                transform 240ms cubic-bezier(0, 0, 0.3, 1);
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

### Carbon Icons

- Open-source SVG icon library
- Sizes: **16px**, **20px**, **24px**, **32px**
- One solid color — no gradients, no multicolor
- Available via `@carbon/icons` and `@carbon/icons-react`

### Pictograms

Carbon also ships **pictograms** — larger illustrative icons for feature highlights, empty states, and editorial content. These are a first-class element, not afterthoughts.

### Icon Rules

- Use 16px for inline/compact UI, 20px as standard, 24–32px for prominent actions
- Always use a single color matching `$icon-primary`, `$icon-secondary`, or `$icon-disabled`
- Pair icons with text labels for accessibility — icon-only buttons need `aria-label`

---

## Interaction States

| State | Color Shift | Token Suffix |
|-------|------------|-------------|
| **Rest** | Base color | (no suffix) |
| **Hover** | Half-step on IBM palette | `-hover` |
| **Active** | Two full steps | `-active` |
| **Selected** | One full step | `-selected` |
| **Focus** | 2px `$focus` border + `$focus-inset` inner ring | N/A |
| **Disabled** | Gray family, intentionally low contrast | `-disabled` |

### Focus Treatment

- **Outer ring**: 2px border, Blue 60 (light) / White (dark)
- **Inner ring**: 1px `$focus-inset` for contrast against the outer ring
- This double-ring pattern is a Carbon signature

### Disabled Elements

Intentionally **not WCAG contrast compliant** — this is by design. Disabled elements should look obviously non-interactive.

---

## Design Tokens

### Token Packages

| Package | Contents |
|---------|----------|
| `@carbon/colors` | Color palettes and theme tokens |
| `@carbon/type` | Typography tokens and mixins |
| `@carbon/layout` | Spacing and grid tokens |
| `@carbon/motion` | Easing and duration tokens |
| `@carbon/themes` | Pre-built theme token sets |

### Token Format

- Primary: Sass variables (`$token-name`)
- Also available: CSS custom properties
- Naming pattern: `$element-role` (e.g., `$border-subtle`, `$text-primary`, `$background-hover`)

---

## Applying Carbon in Comps

When building comps with Carbon principles, follow this checklist:

### Must-Have

- [ ] Use IBM Plex Sans as the primary typeface — load from Google Fonts or self-host
- [ ] Use the spacing scale ($spacing-01 through $spacing-13) — don't invent arbitrary values
- [ ] Use sharp corners (0px border-radius) as the default — this is Carbon's signature
- [ ] Use the layering model for depth — color differentiation, not shadows
- [ ] Choose Productive or Expressive mode and apply consistently
- [ ] Use role-based color tokens — `$text-primary`, `$interactive`, `$support-error`, etc.
- [ ] Implement focus with a 2px border + inset ring on all interactive elements
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] Responsive breakpoints from the Carbon grid (320, 672, 1056, 1312, 1584)
- [ ] 8px mini-unit base for all sizing and spacing
- [ ] Easing curves from the Carbon motion table (productive or expressive)
- [ ] Duration tokens for transitions (70ms–700ms range)
- [ ] Half-step hover states on interactive elements

### Nice-to-Have

- [ ] Support multiple themes (White, Gray 10, Gray 90, Gray 100) via CSS custom properties
- [ ] Productive and Expressive type set switching
- [ ] Pictograms for empty states and feature highlights
- [ ] 2x Grid with 16-column layout at large breakpoints
