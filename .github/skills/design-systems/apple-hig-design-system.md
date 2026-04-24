# Skill: Apple Human Interface Guidelines (HIG)

Procedural knowledge for designing UI comps that follow **Apple's Human Interface Guidelines**. Use this skill when the user explicitly requests Apple/iOS/macOS-style designs, or during blue-sky ideation when HIG is a relevant design direction.

**Canonical source**: https://developer.apple.com/design/human-interface-guidelines

This skill synthesizes the HIG design language for web-based comps: design philosophy, color, typography, spacing, elevation, shapes, motion, iconography, interaction states, and materials.

---

## Design Philosophy

Apple HIG is guided by three pillars:

1. **Hierarchy** — Visual weight and structure guide the eye. Clear levels of importance through size, color, and positioning.
2. **Harmony** — Elements feel like they belong together. Consistent rhythm, proportional spacing, and unified visual language.
3. **Consistency** — Platform conventions are respected. Users shouldn't have to relearn interaction patterns.

Apple's 2025 design language introduces **Liquid Glass** — a material system that adds translucency and depth across all platforms.

---

## Color

### System Colors

12 semantic colors, each with automatic light/dark/high-contrast variants:

Red, Orange, Yellow, Green, Mint, Teal, Cyan, Blue, Indigo, Purple, Pink, Brown

### System Grays (Light Mode)

| Name | Hex |
|------|-----|
| systemGray | `#8E8E93` |
| systemGray2 | `#AEAEB2` |
| systemGray3 | `#C7C7CC` |
| systemGray4 | `#D1D1D6` |
| systemGray5 | `#E5E5EA` |
| systemGray6 | `#F2F2F7` |

### Semantic Color Roles

| Role | Purpose |
|------|---------|
| `label` | Primary text |
| `secondaryLabel` | Secondary text |
| `tertiaryLabel` | Tertiary text |
| `quaternaryLabel` | Quaternary text |
| `placeholderText` | Input placeholder |
| `separator` | Thin dividers (translucent) |
| `opaqueSeparator` | Opaque dividers |
| `link` | Link text (system blue) |

### Background Colors (iOS)

| Category | Tokens |
|----------|--------|
| **System** | `systemBackground`, `secondarySystemBackground`, `tertiarySystemBackground` |
| **Grouped** | `systemGroupedBackground`, `secondarySystemGroupedBackground`, `tertiarySystemGroupedBackground` |

### Fill Colors

4 levels: `systemFill`, `secondarySystemFill`, `tertiarySystemFill`, `quaternarySystemFill`

### Dark Mode

All system colors adapt automatically. Elevated surfaces shift **lighter** in dark mode.

### Accessibility Rules

- Always use semantic color roles — they adapt to light/dark/high-contrast automatically
- Never use color alone to convey meaning
- System colors guarantee accessible contrast in all modes

### In Comps

```css
:root {
    /* Light mode approximation */
    --hig-label: #000000;
    --hig-secondary-label: rgba(60, 60, 67, 0.6);
    --hig-tertiary-label: rgba(60, 60, 67, 0.3);
    --hig-separator: rgba(60, 60, 67, 0.29);
    --hig-system-background: #ffffff;
    --hig-secondary-background: #f2f2f7;
    --hig-tertiary-background: #ffffff;
    --hig-grouped-background: #f2f2f7;
    --hig-system-blue: #007AFF;
    --hig-system-red: #FF3B30;
    --hig-system-green: #34C759;
    --hig-system-orange: #FF9500;
    --hig-system-gray: #8E8E93;
    --hig-system-fill: rgba(120, 120, 128, 0.2);
}
```

---

## Typography

### Font Stack

- **Primary**: SF Pro (iOS/macOS)
- **Compact**: SF Compact (watchOS)
- **Serif**: New York
- **Web fallback**: `-apple-system, BlinkMacSystemFont, 'Helvetica Neue', sans-serif`

### Dynamic Type Styles (iOS, Large Size Category)

| Style | Size | Weight |
|-------|------|--------|
| Large Title | 34pt | Regular |
| Title 1 | 28pt | Regular |
| Title 2 | 22pt | Regular |
| Title 3 | 20pt | Regular |
| Headline | 17pt | Semibold |
| Body | 17pt | Regular |
| Callout | 16pt | Regular |
| Subheadline | 15pt | Regular |
| Footnote | 13pt | Regular |
| Caption 1 | 12pt | Regular |
| Caption 2 | 11pt | Regular |

### macOS Differences

- Body: 13pt (smaller than iOS 17pt)
- Overall scale is more compact

### Size Categories

12+ categories: xSmall, Small, Medium, **Large** (default), xLarge, xxLarge, xxxLarge, AX1–AX5 (accessibility)

Content scales dynamically across all categories. Design for the **Large** default and verify at extremes.

### Styling Rules

- Use the Dynamic Type style names — don't invent arbitrary sizes
- Tracking is built into SF Pro and adjusts automatically per size
- Left-align text (right-align for RTL)
- Support Dynamic Type scaling (use relative units in web comps)

---

## Layout

### Spacing

- **Recommended base**: 8pt/4pt increments (informal — Apple doesn't publish formal tokens)
- **iOS standard margins**: 16pt (20pt on larger devices like iPad)
- **Safe areas**: Always respect safe area insets (notch, home indicator, status bar)

### Size Classes

| Trait | Values | Description |
|-------|--------|-------------|
| Horizontal | Compact, Regular | Width adaptation |
| Vertical | Compact, Regular | Height adaptation (less commonly used) |

Size class combinations determine layout:
- **Compact width + Regular height**: iPhone portrait
- **Regular width + Regular height**: iPad, Mac

### Touch Targets

| Platform | Minimum Size |
|----------|-------------|
| iOS | 44 × 44pt |
| macOS | 28 × 28pt (recommended) |

### In Comps

```css
.container {
    padding: 16px;
    max-width: 1200px;
    margin: 0 auto;
}

@media (min-width: 768px) {
    .container { padding: 20px; }
}
```

---

## Materials

### Liquid Glass (2025)

Apple's new material system creates depth through **translucency, blur, and tint**. Surfaces show through each other, creating a layered, dimensional feel.

### Legacy Materials

| Material | Appearance | Usage |
|----------|-----------|-------|
| **Thin** | Light blur, high transparency | Behind content (e.g., sidebar) |
| **Regular** | Medium blur | Standard material (navigation bars) |
| **Thick** | Heavy blur, less transparency | Prominent surfaces |
| **Chrome** | Opaque with subtle tint | Window chrome, toolbars |

### Vibrancy

Materials can have **vibrancy** — the content behind the surface affects its appearance. Creates a sense of depth and context.

### In Comps

```css
/* Approximate Liquid Glass / material effect */
.glass {
    background: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(20px) saturate(180%);
    -webkit-backdrop-filter: blur(20px) saturate(180%);
    border: 1px solid rgba(255, 255, 255, 0.3);
}

/* Dark mode glass */
.dark .glass {
    background: rgba(30, 30, 30, 0.7);
    border: 1px solid rgba(255, 255, 255, 0.1);
}
```

---

## Elevation

Apple does not use numbered elevation levels. Depth is communicated through **materials, vibrancy, and blur intensity** rather than shadow ramps.

- **Raised surfaces**: Use material blur + slight background lightening
- **Modal surfaces**: Heavier material + scrim
- No formal shadow tokens

### In Comps

```css
.raised {
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(12px);
    border-radius: 12px;
}
.modal-scrim {
    background: rgba(0, 0, 0, 0.4);
}
```

---

## Shapes

### Continuous Corner Radius (Squircle)

Apple uses **continuous corner curves** (squircles) — not standard CSS `border-radius` circular arcs. The squircle produces smoother, more natural-looking corners.

CSS `border-radius` only approximates this. For authentic Apple curves, consider SVG paths or the CSS `shape()` function where available.

### Radius Guidelines

| Element | Approximate Radius |
|---------|-------------------|
| Small elements (badges, tags) | 4–6pt |
| Standard components (buttons, fields) | 8–10pt |
| Cards, sheets | 12–14pt |
| Modals, large surfaces | 14–16pt |
| App icons | 20% of icon width |

### In Comps

```css
/* Standard Apple-like rounding */
.card   { border-radius: 12px; }
.button { border-radius: 8px; }
.modal  { border-radius: 14px; }
.badge  { border-radius: 6px; }
.pill   { border-radius: 9999px; }
```

---

## Motion

### Principles

1. **Purposeful** — Motion communicates spatial relationships and state changes
2. **Brief** — Quick and unobtrusive; never makes users wait
3. **Cancelable** — Users can interrupt and redirect at any time

### Spring Animations

Apple's default animation system uses **spring physics** (mass, stiffness, damping) — not fixed cubic-bezier curves. Animations feel physically grounded.

### Transition Types

| Type | Description |
|------|-------------|
| **Push** | New view slides in from the right (navigation) |
| **Modal** | View slides up from the bottom |
| **Zoom** | Element scales up (app launch, detail reveal) |
| **Dissolve** | Cross-fade between states |

### Accessibility

- **Reduce Motion**: First-class preference. When enabled, dissolves replace slides/zooms.
- Always respect `prefers-reduced-motion`

### In Comps

```css
/* Approximate iOS spring-like transitions */
.transition-push {
    transition: transform 350ms cubic-bezier(0.2, 0.9, 0.3, 1);
}
.transition-modal {
    transition: transform 450ms cubic-bezier(0.2, 0.9, 0.3, 1);
}
.transition-dissolve {
    transition: opacity 250ms ease;
}

@media (prefers-reduced-motion: reduce) {
    * {
        transition: opacity 200ms ease !important;
        animation: none !important;
    }
}
```

---

## Iconography

### SF Symbols

- **6,000+ symbols** — the largest first-party icon set of any design system
- **9 weights** × **3 scales** (small/medium/large)
- **4 rendering modes**: Monochrome, Hierarchical, Palette, Multicolor
- **Variable color**: Supports progress indication (0–100% fill)

### In Web Comps

SF Symbols are not available as a web font. For web comps, approximate with:
1. SVG icons that match the aesthetic (rounded, 1–2px stroke, consistent optical weight)
2. Or use a similar icon set (Lucide, Phosphor) that shares the geometric/rounded style

### Icon Rules

- Match icon weight to nearby text weight
- Use monochrome rendering as default; hierarchical for depth
- Pair icons with text labels for accessibility

---

## Interaction States

| State | Treatment |
|-------|-----------|
| **Highlight/Pressed** | System-managed dimming or tinting |
| **Focus** | Keyboard focus ring (system-controlled, blue outline) |
| **Disabled** | ~30–40% opacity |
| **Selected** | Fill or tint change (system blue) |

Apple does not publish formal state tokens for web. Approximate with:

### In Comps

```css
.interactive:hover {
    background: var(--hig-system-fill);
}
.interactive:active {
    opacity: 0.7;
}
.interactive:focus-visible {
    outline: 3px solid var(--hig-system-blue);
    outline-offset: 2px;
}
.interactive:disabled {
    opacity: 0.35;
    pointer-events: none;
}
```

---

## Applying Apple HIG in Comps

When building comps with HIG principles, follow this checklist:

### Must-Have

- [ ] Use the system font stack (`-apple-system, BlinkMacSystemFont, ...`) — SF Pro loads automatically on Apple devices
- [ ] Use Dynamic Type style names (Large Title, Title 1, Body, etc.) — map to appropriate px/rem sizes
- [ ] Use 12px border-radius for cards, 8px for buttons (continuous corners where possible)
- [ ] Use semantic color roles (system blue for links/actions, system red for destructive, system green for success)
- [ ] Use material-style blur for elevated surfaces (`backdrop-filter: blur`)
- [ ] Minimum 44×44px touch targets
- [ ] Support `prefers-reduced-motion` — dissolves replace slides

### Should-Have

- [ ] Light/dark mode via CSS custom properties — all semantic colors adapt
- [ ] 6-level system gray scale for surface hierarchy
- [ ] Translucent separators (`rgba` with low opacity)
- [ ] Spring-like easing for transitions (fast start, gentle settle)
- [ ] 16px standard margins (20px on wider layouts)

### Nice-to-Have

- [ ] Liquid Glass effect (`backdrop-filter: blur(20px) saturate(180%)`)
- [ ] Grouped vs system background patterns for settings-like layouts
- [ ] Vibrancy effects on surfaces over varied backgrounds
- [ ] Dynamic Type size category scaling (test at Large, xSmall, and AX3)
