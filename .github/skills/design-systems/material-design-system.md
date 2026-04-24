# Skill: Material Design 3

Procedural knowledge for designing UI comps that follow **Google's Material Design 3 (M3)** system. Use this skill when the user explicitly requests Material Design–style designs, or during blue-sky ideation when M3 is a relevant design direction.

**Canonical source**: https://m3.material.io/

This skill synthesizes the M3 design language across its core pillars: design philosophy, color, elevation, iconography, layout, motion, shapes, typography, design tokens, and interaction states.

---

## Design Philosophy

Every M3 design decision should trace back to one of these three themes:

1. **Personal** — Dynamic color adapts the entire UI to a user's wallpaper, content, or brand. Devices feel uniquely theirs. Customization is a first-class citizen, not an afterthought.
2. **Adaptive** — Layouts respond to 5 window size classes (compact through extra-large) with canonical layout patterns. Components swap intelligently across breakpoints.
3. **Expressive** — Motion is physics-based, shapes morph contextually, and typography supports both brand and plain typefaces within the same scale.

---

## Color

M3's color system is built on the **HCT color space** (Hue, Chroma, Tone) — a perceptual color model that combines the hue/chroma of CAM16 with the perceptual luminance of CIE L*.

### HCT Color Space

| Dimension | Range | Description |
|-----------|-------|-------------|
| **Hue** | 0–360° | Color wheel position (red, orange, yellow, green, blue, purple) |
| **Chroma** | 0–~120 | Colorfulness / saturation. 0 = gray, higher = more vivid |
| **Tone** | 0–100 | Perceptual lightness. 0 = black, 100 = white |

HCT guarantees that two colors with the same Tone value have **identical perceived lightness** regardless of hue — critical for accessible contrast calculations.

### From Source Color to UI

1. **Source color** → A single user-chosen or brand color
2. **5 key colors** generated: Primary, Secondary, Tertiary, Neutral, Neutral Variant
3. **Tonal palettes** created for each key color: 13 tones (0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 98, 99, 100)
4. **26 color roles** assigned from the tonal palettes
5. Color roles applied to UI elements

### 26 Color Roles

| Group | Roles |
|-------|-------|
| **Primary** | `primary`, `on-primary`, `primary-container`, `on-primary-container` |
| **Secondary** | `secondary`, `on-secondary`, `secondary-container`, `on-secondary-container` |
| **Tertiary** | `tertiary`, `on-tertiary`, `tertiary-container`, `on-tertiary-container` |
| **Error** | `error`, `on-error`, `error-container`, `on-error-container` |
| **Surface** | `surface`, `on-surface`, `surface-variant`, `on-surface-variant`, `surface-container-lowest`, `surface-container-low`, `surface-container`, `surface-container-high`, `surface-container-highest` |
| **Outline** | `outline`, `outline-variant` |
| **Other** | `inverse-surface`, `inverse-on-surface`, `inverse-primary`, `scrim`, `shadow` |

### Dynamic Color

M3's signature feature — the UI color scheme can automatically derive from:

| Algorithm | Source | Use Case |
|-----------|--------|----------|
| **User-generated** | Device wallpaper | System-wide theming on Android 12+ and desktop |
| **Content-based** | In-app images/media | Contextual theming per screen or content |
| **Custom** | Brand colors fed into the scheme generator | Brand-consistent apps with M3 affordances |

Apps should always define a custom theme as a fallback for users who don't enable dynamic color.

### Contrast Levels

| Level | Description |
|-------|-------------|
| **Standard** | Default M3 contrast — meets WCAG AA |
| **Medium** | Increased contrast between standard and high |
| **High** | Maximum contrast — approaches WCAG AAA |

### Accessibility Rules

- Never use color alone to convey meaning — always pair with text, icons, or patterns
- Use the 26 color role tokens rather than raw hex values — they are theme-aware and contrast-safe
- Support both light and dark modes — M3 color roles resolve to different tonal values per mode
- Use `on-*` color roles for content placed over their paired surface (e.g., `on-primary` text over `primary` background)

### Tooling

- **Material Color Utilities (MCU)**: Open-source at `github.com/material-foundation/material-color-utilities` — Dart, Java, TypeScript, C++, Swift
- **Material Theme Builder**: Figma plugin for visualizing and exporting color schemes

### In Comps

Use CSS custom properties for the 26 color roles. Generate initial values from the Material Theme Builder or define them manually:
```css
:root {
    --md-sys-color-primary: #6750A4;
    --md-sys-color-on-primary: #FFFFFF;
    --md-sys-color-primary-container: #EADDFF;
    --md-sys-color-surface: #FFFBFE;
    --md-sys-color-on-surface: #1C1B1F;
    /* ... remaining roles */
}
```

---

## Elevation

M3 uses **tonal surface color shifts** as the primary depth cue, not shadows. Higher elevation = lighter surface tint from the primary color.

### 6 Elevation Levels

| Level | dp Value | Use For |
|-------|----------|---------|
| **Level 0** | 0dp | Flat surfaces, base layer |
| **Level 1** | 1dp | Cards, navigation bars |
| **Level 2** | 3dp | Elevated cards, bottom app bars |
| **Level 3** | 6dp | FABs, navigation drawers |
| **Level 4** | 8dp | Side sheets, elevated navigation rails |
| **Level 5** | 12dp | Modals, dialogs, bottom sheets |

### Elevation Mechanism

- **Primary method**: Surface tint color (from primary) overlaid at varying opacities per level — higher elevation = more tint
- **Secondary method**: Shadows (offset + blur/diffusion). Used sparingly, mainly for floating elements
- **Scrims**: 32% opacity overlays for modal backdrops

### Surface Container Ramp

Instead of shadow-based elevation, use the surface container color roles for depth hierarchy:

| Role | Elevation Feel | Usage |
|------|---------------|-------|
| `surface-container-lowest` | Deepest background | Recessed areas |
| `surface-container-low` | Slightly raised | Secondary cards |
| `surface-container` | Standard raised | Default cards, containers |
| `surface-container-high` | Prominent | Active/selected containers |
| `surface-container-highest` | Most prominent | Search bars, top-level selection |

### In Comps

Simulate tonal elevation with the surface container roles rather than box-shadows:
```css
.card          { background: var(--md-sys-color-surface-container); }
.card-elevated { background: var(--md-sys-color-surface-container-high); }
.dialog        { background: var(--md-sys-color-surface-container-highest); }
.scrim         { background: rgba(0, 0, 0, 0.32); }
```
Add subtle `box-shadow` only for truly floating elements (FABs, menus) — never as the sole depth cue.

---

## Iconography

### Material Symbols

M3 uses **Material Symbols**, a variable icon font replacing the older Material Icons.

| Property | Details |
|----------|---------|
| **Styles** | 3: Outlined, Rounded, Sharp |
| **Icon count** | 3,000+ symbols |
| **Format** | Variable font (single file, all axes adjustable) |
| **Source** | `fonts.google.com/icons` |

### 4 Variable Axes

| Axis | Range | Default | Description |
|------|-------|---------|-------------|
| **Weight** | 100–700 | 400 | Stroke thickness (like font weight) |
| **Fill** | 0–1 | 0 | 0 = outlined, 1 = filled |
| **Optical Size** | 20–48 | 24 | Adjusts detail level for display size |
| **Grade** | −25 to 200 | 0 | Fine weight adjustment without layout shift |

### Fill Semantics

- **Fill 0** (outlined): Default, unselected, inactive states — navigation icons, action bars
- **Fill 1** (filled): Selected, active, toggled-on states — bottom nav active tab, favorited item

### Icon Rules

- Use **outlined** for unselected/default states; switch to **filled** for selected/active states
- Match icon **weight** to nearby text weight for visual harmony
- Adjust **optical size** to match the render size (20 for small, 48 for large)
- Use **grade** for subtle emphasis changes without affecting layout (e.g., dark mode compensation)
- One color per icon — no multicolor, no gradients

### In Comps

Load the variable font from Google Fonts and control axes via CSS:
```css
@import url('https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0');

.material-symbols-outlined {
    font-family: 'Material Symbols Outlined';
    font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
.icon-filled {
    font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}
```

---

## Layout

### Spacing System

M3 uses a **4dp base unit** for all spacing. On the web, use `4px` or `0.25rem` as the base.

- **Padding**: Measured in 4dp increments between UI elements
- **Margins**: Defined per window size class, wider for larger screens
- **Spacers**: Fixed 24dp between layout panes
- **Line length**: Aim for 40–60 characters per line

### 5 Window Size Classes

| Class | Width Range | Typical Device | Panes |
|-------|-------------|----------------|-------|
| **Compact** | < 600dp | Phone portrait | 1 |
| **Medium** | 600–839dp | Tablet portrait, foldable | 1 (sometimes 2) |
| **Expanded** | 840–1199dp | Tablet landscape, desktop | 2 |
| **Large** | 1200–1599dp | Desktop | 2 |
| **Extra-large** | 1600dp+ | Desktop, ultra-wide | 2+ |

### Responsive Breakpoints (Web)

| Class | CSS Min-Width |
|-------|---------------|
| Compact | 0 |
| Medium | 600px |
| Expanded | 840px |
| Large | 1200px |
| Extra-large | 1600px |

### Layout Anatomy

| Term | Definition |
|------|-----------|
| **Column** | Vertical content area within a pane |
| **Pane** | Major content region (1 for compact/medium, 2 for expanded+) |
| **Margin** | Space between window edge and content |
| **Spacer** | 24dp gap between panes |

### 5 Adaptive Questions

When designing across window sizes, ask:

1. **What should be revealed?** — Show nav drawers, additional panes on larger screens
2. **How should the screen be divided?** — 1 pane (compact/medium) vs 2 panes (expanded+)
3. **What should be resized?** — Cards, feeds, lists, panes grow larger
4. **What should be repositioned?** — Reflow content, add columns, shift navigation
5. **What should be swapped?** — Navigation bar → rail → drawer as width increases

### Component Swaps Across Breakpoints

| Function | Compact | Medium | Expanded+ |
|----------|---------|--------|-----------|
| Navigation | Navigation bar (bottom) | Collapsed nav rail | Nav rail or nav drawer |
| Communication | Full-screen dialog | Simple dialog | Simple dialog |
| Selection | Bottom sheet | Menu | Menu |

### Touch Targets

Minimum interactive target size: **48 × 48dp** (48px on web)

---

## Motion

M3 uses a **physics-based spring system** instead of traditional easing functions with explicit durations. Animations feel physically grounded because duration emerges from the physics simulation.

### Spring Parameters

| Parameter | Description |
|-----------|-------------|
| **Stiffness** | How rigid the spring is (higher = snappier) |
| **Damping** | How quickly oscillation settles (higher = less bounce) |
| **Initial velocity** | Starting speed of the animated value |

### Two Motion Schemes

| Scheme | Character | When to Use |
|--------|-----------|-------------|
| **Expressive** | Overshoot, bounce, playful | Consumer apps, delight-focused UIs |
| **Standard** | Minimal bounce, utilitarian | Productivity apps, enterprise, data-dense UIs |

### Motion Token Structure

Each scheme defines 6 tokens across speed × type:

| | Spatial (position/size) | Effects (opacity/color/blur) |
|---|---|---|
| **Fast** | Button press, icon swap | Quick fade, color shift |
| **Default** | Panel open, page transition | Standard fade, blur change |
| **Slow** | Layout reflow, full-screen transform | Large-scale color/opacity transition |

### Accessibility

- Respect `prefers-reduced-motion` — disable or minimize all animation
- Avoid flashes, jarring movements, or stimuli that could trigger seizures
- Keep motion constrained to the element in focus

### In Comps

Since CSS doesn't natively support spring physics, approximate with tuned cubic-bezier curves or use a JS spring library (`framer-motion`, `react-spring`). For simple comps, use these approximations:

```css
/* Approximate M3 standard-default-spatial */
.transition-standard {
    transition: transform 300ms cubic-bezier(0.2, 0, 0, 1);
}

/* Approximate M3 expressive-default-spatial (slight overshoot) */
.transition-expressive {
    transition: transform 500ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

/* Effects transitions (opacity, color) */
.transition-effects {
    transition: opacity 200ms cubic-bezier(0.2, 0, 0, 1),
                background-color 200ms cubic-bezier(0.2, 0, 0, 1);
}

/* Respect reduced motion */
@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}
```

---

## Shapes

### 10-Step Corner Radius Scale

| Step | Token | Value | Example Usage |
|------|-------|-------|---------------|
| 1 | None | 0dp | Sheet edges, full-bleed images |
| 2 | Extra Small | 4dp | Small chips, compact buttons |
| 3 | Small | 8dp | Standard buttons, text fields |
| 4 | Medium | 12dp | Cards, dialogs |
| 5 | Large | 16dp | FABs, navigation drawers |
| 6 | Large Increased | 20dp | Large cards |
| 7 | Extra Large | 28dp | Bottom sheets, expanded surfaces |
| 8 | Extra Large Increased | 32dp | Large bottom sheets |
| 9 | Extra Extra Large | 48dp | Very large containers |
| 10 | Full | 50% | Circular buttons, avatars, pills |

### Shape Families

| Family | Description |
|--------|-------------|
| **Rounded** | Default — circular arc corners |
| **Cut** | Chamfered/angled corners — an alternative family for brand differentiation |

### Symmetry

- **Symmetric**: All 4 corners share the same radius (default)
- **Asymmetric**: Different radii per corner (e.g., top-rounded, bottom-square for bottom sheets)

### Optical Roundness

For nested rounded rectangles (e.g., a card containing a rounded button):

> **Inner radius = Outer radius − Padding**

This ensures the inner element's curve appears optically consistent with the outer container's curve.

### Shape Morph

Shapes can dynamically change in response to:
- **Interaction**: Press → circle morphs to rounded square
- **Progress**: Loading indicator shape evolution
- **Environment**: Scroll position changes container shape

### In Comps

```css
:root {
    --md-sys-shape-none: 0px;
    --md-sys-shape-xs: 4px;
    --md-sys-shape-s: 8px;
    --md-sys-shape-m: 12px;
    --md-sys-shape-l: 16px;
    --md-sys-shape-l-inc: 20px;
    --md-sys-shape-xl: 28px;
    --md-sys-shape-xl-inc: 32px;
    --md-sys-shape-xxl: 48px;
    --md-sys-shape-full: 9999px;
}

.chip      { border-radius: var(--md-sys-shape-xs); }
.button    { border-radius: var(--md-sys-shape-s); }
.card      { border-radius: var(--md-sys-shape-m); }
.fab       { border-radius: var(--md-sys-shape-l); }
.sheet     { border-radius: var(--md-sys-shape-xl); }
.pill      { border-radius: var(--md-sys-shape-full); }
```

---

## Typography

### Font Stack

- **Primary**: Roboto (Google's signature typeface, 3300+ glyphs, weights 100–900)
- **Variable alternative**: Roboto Flex (weight, width, optical size, grade, slant axes)
- **Serif companion**: Roboto Serif
- **Monospace**: Roboto Mono
- **Global fallback**: Noto Sans (150+ scripts)
- **Web stack**: `Roboto, "Noto Sans", "Helvetica Neue", Arial, sans-serif`

### Type Scale: 15 Baseline Styles

The scale uses a **Major Second (1.125) ratio** between successive sizes.

| Role | Size | Weight | Line Height | Letter Spacing | Usage |
|------|------|--------|-------------|----------------|-------|
| Display Large | 57sp | 400 | 64sp | −0.25sp | Hero banners |
| Display Medium | 45sp | 400 | 52sp | 0 | Large feature text |
| Display Small | 36sp | 400 | 44sp | 0 | Prominent headings |
| Headline Large | 32sp | 400 | 40sp | 0 | Page titles |
| Headline Medium | 28sp | 400 | 36sp | 0 | Section headers |
| Headline Small | 24sp | 400 | 32sp | 0 | Subsection headers |
| Title Large | 22sp | 400 | 28sp | 0 | Card titles, toolbar text |
| Title Medium | 16sp | 500 | 24sp | 0.15sp | Subsection titles |
| Title Small | 14sp | 500 | 20sp | 0.1sp | Small titles |
| Body Large | 16sp | 400 | 24sp | 0.5sp | Primary body text |
| Body Medium | 14sp | 400 | 20sp | 0.25sp | Standard body text |
| Body Small | 12sp | 400 | 16sp | 0.4sp | Secondary text |
| Label Large | 14sp | 500 | 20sp | 0.1sp | Buttons, prominent labels |
| Label Medium | 12sp | 500 | 16sp | 0.5sp | Tabs, small buttons |
| Label Small | 11sp | 500 | 16sp | 0.5sp | Captions, metadata |

**Note**: `sp` maps to `rem` on web. 1sp ≈ 1px at default browser font size. Use `rem` for all type sizing in comps.

### Emphasized Variants

Each of the 15 styles has an **emphasized** variant (`md.sys.typescale.emphasized.*`) that uses different weight/tracking for visual emphasis without changing base size. Use emphasized variants for content that needs to stand out within the same role (e.g., bold body text, accented headlines).

### Typeface Assignment

| Token | Applied To | Default | Customizable |
|-------|-----------|---------|-------------|
| **Brand typeface** | Display, Headline | Roboto | Yes — swap for a custom brand font |
| **Plain typeface** | Title, Body, Label | Roboto | Keep readable for body content |

### Styling Rules

- **Sentence case** for all UI text — avoid ALL CAPS except for short labels where convention demands it (e.g., button text in some M3 implementations uses ALL CAPS for Label Large)
- **Left-align** for LTR languages, **right-align** for RTL
- Use the **type scale tokens** — don't invent arbitrary font sizes
- Aim for **40–60 characters per line** for readability

### Contrast Requirements

- Standard text: minimum **4.5:1** contrast ratio (WCAG AA)
- Large text (≥ 18.5px bold or ≥ 24px regular): minimum **3:1** contrast ratio
- M3 color roles are designed to meet these ratios when paired correctly (`on-*` over its surface)

---

## Design Tokens

M3 uses a **three-tier token architecture**. Always use system-level tokens in comps — never hard-code reference values.

### Token Classes

| Class | Prefix | Description | Example |
|-------|--------|-------------|---------|
| **Reference** | `md.ref.*` | Raw values — colors, sizes, fonts. Platform-agnostic constants. | `md.ref.palette.primary40` |
| **System** | `md.sys.*` | Semantic mappings that reference ref tokens. Theme-aware. | `md.sys.color.primary` |
| **Component** | `md.comp.*` | Per-component bindings that point to system tokens. | `md.comp.filled-button.container.color` |

### Token Flow

```
Reference tokens (raw values)
  ↓ mapped by
System tokens (semantic meaning, theme-aware)
  ↓ consumed by
Component tokens (per-element binding)
```

### Contexts

Tokens resolve to different values based on context:
- **Dark theme** vs light theme
- **Dense layout** vs standard layout
- **High contrast** vs standard contrast

### In Comps

Map M3 system tokens to CSS custom properties. This enables theme switching by swapping a single class:

```css
/* Light theme */
:root, .theme-light {
    --md-sys-color-primary: #6750A4;
    --md-sys-color-on-primary: #FFFFFF;
    --md-sys-color-surface: #FFFBFE;
    --md-sys-color-on-surface: #1C1B1F;
}

/* Dark theme */
.theme-dark {
    --md-sys-color-primary: #D0BCFF;
    --md-sys-color-on-primary: #381E72;
    --md-sys-color-surface: #1C1B1F;
    --md-sys-color-on-surface: #E6E1E5;
}
```

---

## Interaction States

M3 defines **6 interaction states** using a **state layer overlay** system rather than per-component color changes.

### State Definitions

| State | Visual Indicator | Triggered By |
|-------|------------------|-------------|
| **Enabled** | Default appearance | Element is interactive and resting |
| **Disabled** | 38% opacity, no interaction | Element is not currently interactive |
| **Hover** | 8% opacity state layer | Cursor enters element |
| **Focused** | 10% opacity state layer + focus ring | Keyboard/switch navigation |
| **Pressed** | 10% opacity state layer + ripple | Touch/click down |
| **Dragged** | 16% opacity state layer + elevation increase | Long-press then move |

### State Layer System

Instead of changing an element's own color, M3 overlays a semi-transparent **state layer** using the element's content color. This means one set of opacity values works across all surface colors:

- Hover: **8%** opacity
- Focus: **10%** opacity
- Press: **10%** opacity + ripple
- Drag: **16%** opacity + elevation bump

### In Comps

Implement state layers with pseudo-elements:
```css
.interactive {
    position: relative;
    overflow: hidden;
}
.interactive::before {
    content: '';
    position: absolute;
    inset: 0;
    background: currentColor;
    opacity: 0;
    transition: opacity 200ms;
    pointer-events: none;
}
.interactive:hover::before    { opacity: 0.08; }
.interactive:focus::before    { opacity: 0.10; }
.interactive:active::before   { opacity: 0.10; }
.interactive:disabled {
    opacity: 0.38;
    pointer-events: none;
}
```

---

## Applying Material Design in Comps

When building comps with M3 principles, follow this checklist:

### Must-Have

- [ ] Use the M3 type scale — pick styles from the 15 roles, don't invent arbitrary sizes
- [ ] Use 4px-based spacing throughout — all margins, padding, gaps should be multiples of 4
- [ ] Use M3 corner radius tokens — 12dp (Medium) for cards, 8dp (Small) for buttons, Full for pills
- [ ] Use Material Symbols icons — outlined for default, filled for selected states
- [ ] Use the 26 color roles via CSS custom properties — never hard-code raw color values
- [ ] Use surface container roles for elevation — not shadow ramps
- [ ] Implement state layers (hover 8%, focus 10%, press 10%, disabled 38%) on all interactive elements
- [ ] Support `prefers-reduced-motion` with reduced or no animation

### Should-Have

- [ ] Responsive window size classes (compact < 600px, medium 600px, expanded 840px, large 1200px, extra-large 1600px)
- [ ] Touch-friendly targets (48px minimum)
- [ ] Light and dark theme support via CSS custom properties (swap `--md-sys-color-*` values)
- [ ] Component swaps across breakpoints (nav bar → rail → drawer)
- [ ] Optical roundness for nested corners (inner radius = outer radius − padding)

### Nice-to-Have

- [ ] Spring-like motion using CSS cubic-bezier approximations or a JS spring library
- [ ] Expressive motion scheme (overshoot/bounce) for consumer-facing UIs
- [ ] Shape morph on interaction (e.g., FAB corner radius change on press)
- [ ] Scrim overlay (`rgba(0,0,0,0.32)`) for modal dialogs
- [ ] Emphasized type variants for highlighted content within the same role
