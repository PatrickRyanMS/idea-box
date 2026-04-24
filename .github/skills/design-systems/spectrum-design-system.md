# Skill: Adobe Spectrum Design System

Procedural knowledge for designing UI comps that follow **Adobe's Spectrum Design System**. Use this skill when the user explicitly requests Spectrum-style designs, or during blue-sky ideation when Spectrum is a relevant design direction.

**Canonical source**: https://spectrum.adobe.com/

This skill synthesizes the Spectrum design language: design philosophy, color, typography, spacing, elevation, shapes, motion, iconography, interaction states, and tokens.

---

## Design Philosophy

Spectrum is guided by three principles:

1. **Rational** — Every design choice has a reason. Mathematical scales (Major Second for type), structured token naming, dual platform scales (desktop/mobile).
2. **Human** — Serves creative professionals. Warm, not clinical. Adobe Clean typeface adds personality while maintaining clarity.
3. **Focused** — Creative tools demand zero distraction. UI recedes; content commands attention.

---

## Color

### 4 Themes

| Theme | Usage |
|-------|-------|
| **Lightest** | Maximum brightness contexts, embedded panels |
| **Light** | Default theme for most interfaces |
| **Dark** | Default dark mode |
| **Darkest** | Maximum contrast dark contexts, immersive media editing |

### Color Palette

- **Gray**: 11 tints/shades per theme
- **13 semantic colors**, each with **14 tints/shades**: Gray, Red, Orange, Yellow, Chartreuse, Celery, Green, Seafoam, Cyan, Blue, Indigo, Purple, Fuchsia, Magenta
- **Semantic roles**: `informative` (blue), `accent` (blue), `negative` (red), `notice` (orange), `positive` (green)

### Static Colors

Spectrum provides **transparent white** and **transparent black** sets (0–1000) for elements that must look the same across all four themes. Use these for overlays, badges, or content-over-media.

### Token Naming

`--spectrum-{color}-{shade}` (e.g., `--spectrum-blue-900`, `--spectrum-gray-200`)

### Accessibility Rules

- Ensure sufficient contrast between foreground and background across all 4 themes
- Use semantic color roles rather than raw spectrum colors
- Shadow opacity increases on dark/darkest themes to maintain visibility

### In Comps

```css
:root {
    /* Light theme baseline */
    --spectrum-gray-50: #ffffff;
    --spectrum-gray-100: #f5f5f5;
    --spectrum-gray-200: #e8e8e8;
    --spectrum-gray-800: #323232;
    --spectrum-gray-900: #1a1a1a;
    --spectrum-blue-900: #0054b6;
    --spectrum-red-900: #c9252d;
    --spectrum-green-700: #12805c;
    --spectrum-orange-700: #cb6f10;
}
```

---

## Typography

### Font Stack

- **Primary**: Adobe Clean (proprietary to Adobe products)
- **Serif**: Adobe Clean Serif
- **CJK**: Adobe Clean Han
- **Mono**: Source Code Pro (open-source)
- **Web fallback**: `'Adobe Clean', 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif`

### Type Scale

**Major second ratio (1.125×)**. 15 token sizes with separate desktop and mobile values:

| Token | Desktop | Mobile |
|-------|---------|--------|
| `font-size-50` | 11px | 12px |
| `font-size-75` | 12px | 13px |
| `font-size-100` | 14px | 15px |
| `font-size-200` | 16px | 17px |
| `font-size-300` | 18px | 19px |
| `font-size-400` | 20px | 22px |
| `font-size-500` | 22px | 24px |
| `font-size-600` | 25px | 27px |
| `font-size-700` | 28px | 31px |
| `font-size-800` | 32px | 35px |
| `font-size-900` | 36px | 40px |
| `font-size-1000` | 40px | 45px |
| `font-size-1100` | 45px | 50px |
| `font-size-1200` | 50px | 56px |
| `font-size-1300` | 60px | 67px |

### Line Height Rules

| Content Type | Multiplier (Latin) | Multiplier (Han/CJK) |
|-------------|-------------------|---------------------|
| Heading / Detail | 1.3× font size | 1.5× font size |
| Body / Code | 1.5× font size | 1.7× font size |

### Styling Rules

- Use the token-based size scale — don't invent arbitrary sizes
- Always choose desktop or mobile scale based on the target platform
- Pair body text at `font-size-100` (14px) or `font-size-200` (16px) for readability

---

## Spacing

12 tokens:

| Token | Size |
|-------|------|
| `spacing-50` | 2px |
| `spacing-75` | 4px |
| `spacing-100` | 8px |
| `spacing-200` | 12px |
| `spacing-300` | 16px |
| `spacing-400` | 24px |
| `spacing-500` | 32px |
| `spacing-600` | 40px |
| `spacing-700` | 48px |
| `spacing-800` | 64px |
| `spacing-900` | 80px |
| `spacing-1000` | 96px |

Use `spacing-100` (8px) as the base unit for most component internal padding.

---

## Layout

### Dual Platform Scale

Spectrum maintains **separate desktop and mobile scales** for all dimensions — font sizes, component heights, spacing, and touch targets all have proportionally adjusted values.

| Scale | Context | Touch Target Minimum |
|-------|---------|---------------------|
| **Desktop** | Mouse/keyboard input | Standard (no minimum enforced) |
| **Mobile** | Touch input | 44px |

### In Comps

Match the platform scale to your target. For responsive comps, switch scales at a mobile breakpoint:

```css
/* Desktop scale (default) */
.button { height: 32px; font-size: 14px; }

/* Mobile scale */
@media (max-width: 768px) {
    .button { height: 40px; font-size: 15px; }
}
```

---

## Elevation

Spectrum uses **one default shadow style per scale**, with opacity increasing on dark/darkest themes. Shadows are subtle — Spectrum relies more on background differentiation and borders than heavy shadows.

### In Comps

```css
.elevated {
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.16);
}
.theme-dark .elevated {
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.32);
}
```

---

## Shapes

### Corner Radius

| Token | Desktop | Mobile | Usage |
|-------|---------|--------|-------|
| **Default** | 4px | 5px | Most components (fields, tags, popovers) |
| **Small** | 2px | 2px | Checkboxes inner border |
| **Full** | 50% / pill | 50% / pill | Primary buttons, calls to action |

### Border Width

| Width | Usage |
|-------|-------|
| **1px** | Fields, tags, popovers (most common) |
| **2px** | Buttons, sliders, tabs, focus ring |
| **4px** | Large dividers only |

### In Comps

```css
:root {
    --spectrum-border-radius-default: 4px;
    --spectrum-border-radius-small: 2px;
    --spectrum-border-radius-full: 9999px;
    --spectrum-border-width-thin: 1px;
    --spectrum-border-width-thick: 2px;
}

.field       { border-radius: var(--spectrum-border-radius-default); border: var(--spectrum-border-width-thin) solid; }
.button      { border-radius: var(--spectrum-border-radius-full); border: var(--spectrum-border-width-thick) solid; }
.checkbox    { border-radius: var(--spectrum-border-radius-small); }
```

---

## Motion

### 3 Easing Curves

| Curve | CSS Value | Usage |
|-------|-----------|-------|
| **Ease-out** | `cubic-bezier(0, 0, 0.40, 1)` | Objects entering, user-initiated actions |
| **Ease-in** | `cubic-bezier(0.50, 0, 1, 1)` | Objects exiting, dismissals |
| **Ease-in-out** | `cubic-bezier(0.45, 0, 0.40, 1)` | Objects transitioning in place |

### 10 Duration Tokens

| Token | Duration | Usage |
|-------|----------|-------|
| `duration-100` | 130ms | Micro-interactions |
| `duration-200` | 160ms | Small fades |
| `duration-300` | 190ms | Button transitions |
| `duration-400` | 220ms | Field transitions |
| `duration-500` | 250ms | Panel reveals |
| `duration-600` | 300ms | Standard transitions |
| `duration-700` | 350ms | Dialogs, popovers |
| `duration-800` | 400ms | Page transitions |
| `duration-900` | 450ms | Large panels |
| `duration-1000` | 500ms | Full-screen transitions |

### Accessibility

- Respect `prefers-reduced-motion`
- Keep motion functional — creative tools require zero distracting animation

### In Comps

```css
.element-enter {
    transition: opacity 250ms cubic-bezier(0, 0, 0.40, 1),
                transform 250ms cubic-bezier(0, 0, 0.40, 1);
}
.element-exit {
    transition: opacity 160ms cubic-bezier(0.50, 0, 1, 1),
                transform 160ms cubic-bezier(0.50, 0, 1, 1);
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

### Spectrum Icons

- SVG icon set in two categories: **Workflow** (UI actions) and **UI** (component internal)
- Multiple sizes available
- Single color per icon — no gradients

### Icon Rules

- Match icon size to the platform scale (desktop or mobile)
- Use workflow icons for actions/navigation, UI icons for internal component chrome
- One color only — matches the surrounding text or interactive color token

---

## Interaction States

States are managed per-component via CSS custom properties:

| State | Visual Treatment |
|-------|-----------------|
| **Default** | Base appearance |
| **Hover** | Subtle background/border shift |
| **Active** | Deeper color shift |
| **Focus** | 2px blue focus ring |
| **Disabled** | Reduced opacity, no interaction |

---

## Design Tokens

### Token Format

- CSS custom properties: `--spectrum-{category}-{property}-{variant}-{state}`
- Also available as JSON/YAML via `@adobe/spectrum-tokens`
- Each design element has **individual semantic versioning**

### Token Naming Convention

```
--spectrum-{component}-{variant}-{property}-{state}
```

Example: `--spectrum-button-primary-background-color-hover`

---

## Applying Spectrum in Comps

When building comps with Spectrum principles, follow this checklist:

### Must-Have

- [ ] Use the font-size token scale (50–1300) — don't invent arbitrary sizes
- [ ] Use the spacing token scale (50–1000) — 8px base
- [ ] Use 4px default border-radius for most components; pill for primary CTAs
- [ ] Use semantic color roles (informative, accent, negative, notice, positive)
- [ ] Implement hover/active/focus/disabled states on all interactive elements
- [ ] 2px focus ring on keyboard-focused elements
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] Support all 4 themes (lightest, light, dark, darkest) via CSS custom properties
- [ ] Dual platform scale (desktop + mobile dimensions)
- [ ] Easing curves from the Spectrum motion table (ease-out for enter, ease-in for exit)
- [ ] Duration tokens for transitions (130ms–500ms range)
- [ ] 1px borders for fields/containers, 2px for buttons/focus

### Nice-to-Have

- [ ] Static color palette for cross-theme-consistent elements
- [ ] Creative-tool-specific components (color picker, color wheel, meter)
- [ ] Increased shadow opacity in dark themes
