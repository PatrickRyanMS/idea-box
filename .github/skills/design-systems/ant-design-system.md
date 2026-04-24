# Skill: Ant Design System

Procedural knowledge for designing UI comps that follow **Alibaba's Ant Design System**. Use this skill when the user explicitly requests Ant Design–style designs, or during blue-sky ideation when Ant Design is a relevant design direction.

**Canonical source**: https://ant.design/

This skill synthesizes the Ant Design language: design philosophy, color, typography, spacing, elevation, shapes, motion, iconography, interaction states, and tokens.

---

## Design Philosophy

Ant Design follows four design values:

1. **Natural** — Reduce cognitive load by making interactions feel intuitive and expected. Follow natural patterns of human behavior.
2. **Certain** — Provide clear, unambiguous feedback. Users should always know what's happening and what to do next.
3. **Meaningful** — Every element serves a purpose. Meaningful design reduces noise and focuses attention.
4. **Growing** — Design for long-term use. Systems should be extensible and improve over time.

Ant Design is optimized for **enterprise-class, data-heavy applications** — complex forms, tables, dashboards, and admin panels.

---

## Color

### HSB Color Model

Ant Design generates palettes using **HSB (Hue, Saturation, Brightness)** — not hex or HSL. Each primary color produces a 10-shade palette mathematically.

### 12 Primary Colors

Each with 10 shades (120 total colors):

Dust Red, Volcano, Sunset Orange, Calendula Gold, Sunrise Yellow, Lime, Polar Green, Cyan, Daybreak Blue, Geek Blue, Golden Purple, Magenta

### Brand Color

**Daybreak Blue 6** = `#1677ff` — the default primary action color.

### Neutral Palette

14 steps: `gray-0` (`#ffffff`) through `gray-13` (`#000000`)

### Functional Colors

| Role | Color Family | Default |
|------|-------------|---------|
| **Success** | Green | Green 6 |
| **Error** | Red | Red 5 |
| **Warning** | Gold | Gold 6 |
| **Link** | Blue | Blue 6 |

### Text Colors (Transparency-Based)

| Role | Value | Contrast |
|------|-------|----------|
| **Primary** | `rgba(0, 0, 0, 0.88)` | WCAG AAA (7:1) |
| **Secondary** | `rgba(0, 0, 0, 0.65)` | |
| **Tertiary** | `rgba(0, 0, 0, 0.45)` | |
| **Disabled** | `rgba(0, 0, 0, 0.25)` | |

### Dark Mode

Full support via `algorithm: theme.darkAlgorithm` in `ConfigProvider`. All colors invert automatically.

### In Comps

```css
:root {
    --ant-color-primary: #1677ff;
    --ant-color-success: #52c41a;
    --ant-color-warning: #faad14;
    --ant-color-error: #ff4d4f;
    --ant-color-text: rgba(0, 0, 0, 0.88);
    --ant-color-text-secondary: rgba(0, 0, 0, 0.65);
    --ant-color-text-tertiary: rgba(0, 0, 0, 0.45);
    --ant-color-text-disabled: rgba(0, 0, 0, 0.25);
    --ant-color-bg-container: #ffffff;
    --ant-color-bg-elevated: #ffffff;
    --ant-color-border: #d9d9d9;
}
```

---

## Typography

### Font Stack

```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue',
    Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
    'Segoe UI Symbol', 'Noto Color Emoji';
```

Ant Design uses **system fonts** — no custom typeface required.

### Base Size

**14px** — intentionally smaller than the 16px industry standard, optimized for data-dense enterprise UIs.

### Type Scale

Inspired by pentatonic/natural logarithm: 10 sizes:

| Step | Size | Common Usage |
|------|------|-------------|
| 1 | 12px | Small labels, metadata, captions |
| 2 | 14px | **Base** — body text, form labels, table cells |
| 3 | 16px | Subtitle, emphasized body |
| 4 | 20px | H4 / small heading |
| 5 | 24px | H3 / section heading |
| 6 | 30px | H2 / page heading |
| 7 | 38px | H1 / large heading |
| 8 | 46px | Display small |
| 9 | 56px | Display medium |
| 10 | 68px | Display large / hero |

### Weights

| Weight | Value | Usage |
|--------|-------|-------|
| Regular | 400 | Body text, labels |
| Medium | 500 | Emphasis, subheadings |
| SemiBold | 600 | Headings, buttons |

### Line Height

Formula: `fontSize + 8px` (e.g., 14px text → 22px line-height)

---

## Layout

### Grid System

- **Base unit**: 8px
- **Raster**: 24-column grid at 1440px design width
- **Common spacing**: Multiples of 8 — 8, 16, 24, 32, 40, 48, 56, 64, 72, 80

### Layout Patterns

| Pattern | Structure |
|---------|-----------|
| **Left-Right** | Fixed left navigation, fluid right content area |
| **Top-Bottom** | Fixed header/nav, fixed margins, fluid center content |

### Breakpoints

Ant Design's Grid component uses 6 breakpoints:

| Name | Width |
|------|-------|
| xs | < 576px |
| sm | ≥ 576px |
| md | ≥ 768px |
| lg | ≥ 992px |
| xl | ≥ 1200px |
| xxl | ≥ 1600px |

---

## Elevation

### 3-Layer Directional Shadow System

Ant Design uses **triple-stacked box-shadows** for realistic depth. Each elevation level has **directional variants** (up, down, left, right).

| Level | Usage | CSS (down direction) |
|-------|-------|---------------------|
| **Layer 1** | Cards, slight lift | `0 1px 2px -2px rgba(0,0,0,0.16), 0 3px 6px 0 rgba(0,0,0,0.12), 0 5px 12px 4px rgba(0,0,0,0.09)` |
| **Layer 2** | Dropdowns, popovers | `0 3px 6px -4px rgba(0,0,0,0.12), 0 6px 16px 0 rgba(0,0,0,0.08), 0 9px 28px 8px rgba(0,0,0,0.05)` |
| **Layer 3** | Modals, dialogs | `0 6px 16px -8px rgba(0,0,0,0.08), 0 9px 28px 0 rgba(0,0,0,0.05), 0 12px 48px 16px rgba(0,0,0,0.03)` |

### Directional Variants

Each layer has `-up`, `-down`, `-left`, `-right` variants. The offset direction changes while the three-shadow structure remains.

### In Comps

```css
.card     { box-shadow: 0 1px 2px -2px rgba(0,0,0,0.16), 0 3px 6px 0 rgba(0,0,0,0.12), 0 5px 12px 4px rgba(0,0,0,0.09); }
.dropdown { box-shadow: 0 3px 6px -4px rgba(0,0,0,0.12), 0 6px 16px 0 rgba(0,0,0,0.08), 0 9px 28px 8px rgba(0,0,0,0.05); }
.modal    { box-shadow: 0 6px 16px -8px rgba(0,0,0,0.08), 0 9px 28px 0 rgba(0,0,0,0.05), 0 12px 48px 16px rgba(0,0,0,0.03); }
```

---

## Shapes

### Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `borderRadiusSM` | 4px | Small elements (tags, mini buttons) |
| `borderRadius` | 6px | **Default** — buttons, inputs, cards |
| `borderRadiusLG` | 8px | Large elements (modals, large cards) |

All values are configurable via the `ConfigProvider` theme API.

### Border Width

Default: 1px for most borders (`--ant-color-border: #d9d9d9`)

---

## Motion

### Principles

1. **Natural** — Motion follows natural physics and human expectation
2. **Performant** — Animations never block interaction
3. **Concise** — Motion is brief; don't slow users down

### Ant Motion Library

Separate package (`@ant-design/motion`) providing pre-built CSS transition classes:

| Class Pattern | Type |
|--------------|------|
| `ant-move-{direction}` | Slide in/out from direction |
| `ant-slide-{direction}` | Slide with fade |
| `ant-zoom-{variant}` | Scale transitions (zoom-up, zoom-big, zoom-big-fast) |
| `ant-fade` | Opacity transitions |

### Duration

Typically **200–300ms** for micro-interactions.

### In Comps

```css
.element-enter {
    transition: opacity 200ms ease-out, transform 200ms ease-out;
}
.element-exit {
    transition: opacity 150ms ease-in, transform 150ms ease-in;
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

### @ant-design/icons

- **800+ icons** in three variants: Outlined, Filled, TwoTone
- SVG-based, tree-shakeable
- Use Outlined as default; Filled for active/selected states; TwoTone for decorative accents

### Icon Rules

- Pair icons with text labels for clarity
- Use a single color matching the surrounding text token
- TwoTone icons use the primary color as their accent — configurable

---

## Interaction States

| State | Visual Treatment |
|-------|-----------------|
| **Hover** | Subtle background or border color shift |
| **Active/Pressed** | Deeper color shift |
| **Focus** | Blue outline ring |
| **Disabled** | Reduced opacity + gray styling, `pointer-events: none` |

### In Comps

```css
.interactive:hover   { background: rgba(0, 0, 0, 0.04); }
.interactive:active  { background: rgba(0, 0, 0, 0.08); }
.interactive:focus-visible { outline: 2px solid var(--ant-color-primary); outline-offset: 1px; }
.interactive:disabled {
    opacity: 0.5;
    pointer-events: none;
    color: var(--ant-color-text-disabled);
}
```

---

## Design Tokens

### ConfigProvider Theme API

Since v5, Ant Design uses **CSS-in-JS tokens** via `ConfigProvider`:

| Category | Example Tokens |
|----------|---------------|
| **Color** | `colorPrimary`, `colorSuccess`, `colorWarning`, `colorError`, `colorInfo` |
| **Backgrounds** | `colorBgContainer`, `colorBgElevated`, `colorBgLayout` |
| **Text** | `colorText`, `colorTextSecondary`, `colorTextTertiary`, `colorTextDisabled` |
| **Border** | `colorBorder`, `colorBorderSecondary`, `borderRadius`, `borderRadiusSM`, `borderRadiusLG` |
| **Sizing** | `fontSize`, `fontSizeSM`, `fontSizeLG`, `controlHeight`, `controlHeightSM`, `controlHeightLG` |
| **Spacing** | `margin`, `marginSM`, `marginLG`, `padding`, `paddingSM`, `paddingLG` |

### Theme Algorithms

| Algorithm | Description |
|-----------|-------------|
| `theme.defaultAlgorithm` | Light theme |
| `theme.darkAlgorithm` | Dark theme |
| `theme.compactAlgorithm` | Dense/compact spacing |

Algorithms can be **combined** (e.g., dark + compact).

### Theme Editor

Visual tool at `ant.design/theme-editor` for real-time token customization and export.

---

## Applying Ant Design in Comps

When building comps with Ant Design principles, follow this checklist:

### Must-Have

- [ ] Use system font stack — no custom font loading required
- [ ] Use 14px as the base font size (not 16px) — this is an Ant Design signature
- [ ] Use the type scale (12–68px) — don't invent arbitrary sizes
- [ ] Use 6px default border-radius — 4px for small elements, 8px for large
- [ ] Use 3-layer directional shadows for elevation (triple box-shadow per level)
- [ ] Use the functional color tokens (primary blue, success green, warning gold, error red)
- [ ] Use transparency-based text colors (`rgba(0,0,0,0.88)` primary, `.65` secondary, `.45` tertiary)
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] 8px grid system for all spacing
- [ ] 24-column grid layout at desktop widths
- [ ] Responsive breakpoints (xs/sm/md/lg/xl/xxl)
- [ ] Hover/active/focus/disabled states on all interactive elements
- [ ] Dark mode via inverted token values

### Nice-to-Have

- [ ] Compact mode with reduced spacing for data-dense views
- [ ] TwoTone icons for decorative highlights
- [ ] Ant Motion transition classes for enter/exit animations
- [ ] ConfigProvider-style token theming via CSS custom properties
