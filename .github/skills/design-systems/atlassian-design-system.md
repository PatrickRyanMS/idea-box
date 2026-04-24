# Skill: Atlassian Design System

Procedural knowledge for designing UI comps that follow **Atlassian's Design System**. Use this skill when the user explicitly requests Atlassian-style designs, or during blue-sky ideation when the Atlassian system is a relevant design direction.

**Canonical source**: https://atlassian.design/

This skill synthesizes the Atlassian design language: design philosophy, color, typography, spacing, elevation, shapes, iconography, interaction states, and tokens.

---

## Design Philosophy

Atlassian's system is **designed for teams** — collaboration products like Jira, Confluence, Trello, and Bitbucket. Core tenets:

1. **Token-first architecture** — Everything flows through design tokens. No raw values in components.
2. **Functional clarity** — UI that helps teams plan, track, and ship work. Information density is a feature, not a bug.
3. **Consistency at scale** — Unified patterns across a family of products used by millions of teams.

---

## Color

### Token-Based System

All colors are accessed exclusively via design tokens — never raw hex values. Tokens resolve to different values per theme (light/dark).

### Semantic Roles

| Role | Purpose |
|------|---------|
| **brand** | Primary brand color (Atlassian blue) |
| **neutral** | Default surfaces, text, borders |
| **accent** | Emphasis, interactive elements |
| **information** | Informational states (blue) |
| **success** | Positive states (green) |
| **warning** | Caution states (yellow) |
| **danger** | Error/destructive states (red) |
| **discovery** | New/promotional content (purple) |
| **selected** | Selected/active items |

### Background Tokens

| Token Pattern | Description |
|--------------|-------------|
| `color.background.neutral` | Default surface |
| `color.background.neutral.subtle` | Subtle surfaces (e.g., page background) |
| `color.background.brand.bold` | Bold brand background |
| `color.background.danger` | Error backgrounds |
| `color.background.success` | Success backgrounds |
| `color.background.warning` | Warning backgrounds |
| `color.background.discovery` | Discovery/promo backgrounds |
| `color.background.selected` | Selected item backgrounds |

### Text Tokens

| Token | Usage |
|-------|-------|
| `color.text` | Primary text |
| `color.text.subtle` | Secondary text |
| `color.text.subtlest` | Tertiary text |
| `color.text.inverse` | Text on bold/dark backgrounds |
| `color.text.brand` | Brand-colored text |
| `color.text.danger` | Error text |
| `color.text.success` | Success text |
| `color.text.warning` | Warning text |
| `color.text.discovery` | Discovery text |

### Border Tokens

| Token | Usage |
|-------|-------|
| `color.border` | Default borders |
| `color.border.bold` | Emphasized borders |
| `color.border.focused` | Focus ring (blue) |

### In Comps

```css
:root {
    /* Atlassian light theme approximation */
    --ads-color-background: #ffffff;
    --ads-color-background-neutral-subtle: #f7f8f9;
    --ads-color-background-brand-bold: #0052CC;
    --ads-color-background-danger: #ffedeb;
    --ads-color-background-success: #dffcf0;
    --ads-color-background-warning: #fff7d6;
    --ads-color-background-discovery: #f3f0ff;
    --ads-color-background-selected: #e9f2ff;
    --ads-color-text: #172b4d;
    --ads-color-text-subtle: #44546f;
    --ads-color-text-subtlest: #626f86;
    --ads-color-text-inverse: #ffffff;
    --ads-color-text-brand: #0052CC;
    --ads-color-text-danger: #ae2a19;
    --ads-color-border: #091e4224;
    --ads-color-border-focused: #388bff;
}
```

---

## Typography

### Font Stack

- **Primary**: Atlassian Sans (custom typeface for Atlassian products)
- **Mono**: Atlassian Mono
- **Web fallback**: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Noto Sans', sans-serif`

### Units

All typography uses **rem** — never px.

### Heading Scale

| Size | Name |
|------|------|
| XXL | Largest heading |
| XL | Page title |
| L | Section heading |
| M | Subsection heading |
| S | Card/panel heading |
| XS | Sidebar heading |
| XXS | Smallest heading |

### Body Scale

| Size | Usage |
|------|-------|
| Large | Emphasized body text |
| Medium | **Default** body text |
| Small | Secondary body text, metadata |

### Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Regular | 400 | Body text |
| Medium | 500 | Emphasis |
| Bold | 700 | Headings, strong emphasis |

---

## Spacing

### Base Unit

**8px**

### Spacing Scale

| Token | Size |
|-------|------|
| `space.0` | 0px |
| `space.025` | 2px |
| `space.050` | 4px |
| `space.075` | 6px |
| `space.100` | 8px |
| `space.150` | 12px |
| `space.200` | 16px |
| `space.250` | 20px |
| `space.300` | 24px |
| `space.400` | 32px |
| `space.500` | 40px |
| `space.600` | 48px |
| `space.800` | 64px |
| `space.1000` | 80px |

Negative values also available: `space.negative.100` = -8px, etc.

### Spacing Rules

- Use space tokens for all margins, padding, and gaps
- `space.100` (8px) is the most common internal padding
- `space.200` (16px) is standard page margin
- Never use arbitrary pixel values

---

## Elevation

### 5 Named Levels

| Level | Token | Usage |
|-------|-------|-------|
| **Sunken** | `elevation.surface.sunken` | Below default — page background behind cards |
| **Default** | `elevation.surface` | Base level surface |
| **Raised** | `elevation.surface.raised` + `elevation.shadow.raised` | Cards, containers |
| **Overlay** | `elevation.surface.overlay` + `elevation.shadow.overlay` | Dropdowns, modals, popovers |
| **Overflow** | `elevation.shadow.overflow` | Scroll shadows for truncated content |

### Z-Index Scale

| Value | Purpose |
|-------|---------|
| 100 | Blanket (full page overlay underlay) |
| 200 | Modal |
| 300 | Flag (notifications) |
| 400 | Navigation |
| 500 | Tooltip |
| 510 | Spotlight |
| 600 | Layer |
| 700 | Popup |
| 800 | Overlay |

### In Comps

```css
.surface-sunken  { background: var(--ads-color-background-neutral-subtle); }
.surface-default { background: var(--ads-color-background); }
.surface-raised  { background: var(--ads-color-background); box-shadow: 0 1px 3px rgba(9,30,66,0.13); }
.surface-overlay { background: var(--ads-color-background); box-shadow: 0 4px 8px -2px rgba(9,30,66,0.25), 0 0 1px rgba(9,30,66,0.31); }
```

---

## Shapes

Atlassian does not publish an independent corner radius scale. Components use consistent but component-scoped radius values:

- Small elements (lozenges, badges): 3px
- Standard components (buttons, inputs): 3–4px
- Cards, containers: 4–8px
- Modals, dialogs: 4–8px

Atlassian favors **subtle rounding** — not sharp (0px) and not heavy (12px+).

---

## Motion

Atlassian does not publish extensive motion tokens. Transitions are subtle and focused on functional feedback rather than expressive delight. General guidelines:

- Keep transitions **fast** (150–300ms)
- Use **ease-out** for entering elements, **ease-in** for exiting
- Motion is functional — it aids understanding, not decoration

---

## Iconography

### Atlaskit Icons

- SVG-based icon set
- Available via `@atlaskit/icon` package
- Match icon color to text tokens

### Icon Rules

- Pair icons with text labels for clarity
- Use consistent sizing — match the surrounding text scale
- Icons are functional — they aid navigation and comprehension

---

## Interaction States

Token-based state management:

| State | Token Pattern | Treatment |
|-------|--------------|-----------|
| **Hover** | `color.background.neutral.hovered` | Subtle background shift |
| **Pressed** | `color.background.neutral.pressed` | Deeper shift |
| **Selected** | `color.background.selected` | Blue tint |
| **Focus** | `color.border.focused` | Blue focus ring |
| **Disabled** | `color.background.disabled` | Gray, non-interactive |

### In Comps

```css
.interactive       { background: var(--ads-color-background); }
.interactive:hover { background: rgba(9, 30, 66, 0.04); }
.interactive:active { background: rgba(9, 30, 66, 0.08); }
.interactive[aria-selected="true"] { background: var(--ads-color-background-selected); }
.interactive:focus-visible {
    outline: 2px solid var(--ads-color-border-focused);
    outline-offset: 2px;
}
.interactive:disabled {
    opacity: 0.5;
    pointer-events: none;
}
```

---

## Design Tokens

### Token Package

`@atlaskit/tokens` — the central source of truth.

### Token Format

CSS custom properties with **dot notation** naming:

```
color.background.brand.bold
color.text.subtle
space.200
elevation.shadow.raised
```

### Architecture

Tokenized end-to-end — components consume **only** tokens, never raw values. This is the strictest token enforcement of any major design system.

### Layout Primitives

Atlassian provides layout primitives that auto-consume tokens:

| Primitive | Purpose |
|-----------|---------|
| `Box` | Generic container |
| `Stack` | Vertical layout |
| `Inline` | Horizontal layout |
| `Flex` | Flexbox wrapper |
| `Grid` | Grid layout |
| `Bleed` | Negative margin utility |
| `Xcss` | Styled-component-like API with token enforcement |

---

## Applying Atlassian in Comps

When building comps with Atlassian principles, follow this checklist:

### Must-Have

- [ ] Use design tokens for all values — no raw hex colors, no arbitrary spacing
- [ ] Use semantic color roles (brand, neutral, success, danger, warning, discovery)
- [ ] Use the spacing scale (space.025 through space.1000) — 8px base
- [ ] Use subtle border-radius (3–4px for standard elements, 4–8px for containers)
- [ ] Implement 5-level elevation (sunken, default, raised, overlay, overflow)
- [ ] Focus ring: 2px solid brand blue on keyboard focus
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] Light/dark theme support via token swapping
- [ ] Z-index scale for overlay stacking (100–800)
- [ ] Hover/pressed/selected/disabled states via state tokens
- [ ] rem-based typography
- [ ] Atlassian Sans (or system font fallback) as primary typeface

### Nice-to-Have

- [ ] Sunken surfaces for page backgrounds behind card grids
- [ ] Overflow scroll shadows for truncated content areas
- [ ] Discovery color role (purple) for new features and promotions
- [ ] Pragmatic Drag and Drop patterns for reorderable lists
