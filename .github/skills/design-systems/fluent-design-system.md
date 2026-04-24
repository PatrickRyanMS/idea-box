# Skill: Fluent 2 Design System

Procedural knowledge for designing UI comps that follow the **Microsoft Fluent 2 Design System**. Use this skill when the user explicitly requests Fluent-style designs, or during blue-sky ideation when Fluent is a relevant design direction.

**Canonical source**: https://fluent2.microsoft.design/

This skill synthesizes the nine Fluent 2 design language pillars: design principles, color, elevation, iconography, layout, material, motion, shapes, and typography.

---

## Design Principles

Every Fluent design decision should trace back to one of these four principles:

1. **Natural on every platform** — Adapt to the device and platform. Reuse native conventions for ~80% of the UI. The remaining ~20% carries Fluent identity (signature moments, branding). Don't fight the platform.
2. **Built for focus** — Reduce clutter. Surface only what's needed. Inspire confident action through clarity. Progressive disclosure over information overload.
3. **One for all, all for one** — Inclusive design is non-negotiable. Design for the full range of human abilities — visual, motor, cognitive, situational. Accessibility is a feature, not a checklist item.
4. **Unmistakably Microsoft** — Signature experiences that feel like Microsoft. Brand recognition through consistent visual vocabulary, not forced branding.

---

## Color

### Three Palette Types

| Palette | Purpose | Usage |
|---------|---------|-------|
| **Neutral** | Surfaces, text, layout structure | Black, white, and grays. Lighter tones = higher visual hierarchy. Forms the canvas. |
| **Shared** | Cross-product identity and semantics | M365 suite colors (Outlook blue, Excel green, etc.) for avatars, calendars, badges. Also semantic colors. |
| **Brand** | Product-specific identity | Unique to each product. Use sparingly — CTAs, selected/active states, key interactive elements. |

### Semantic Colors

| Color | Meaning | Use For |
|-------|---------|---------|
| Red | Danger / destructive | Error states, delete actions, critical alerts |
| Yellow | Caution / warning | Warnings, pending states, attention needed |
| Green | Positive / success | Success confirmations, completion, available status |

### Interaction States

States get progressively **darker** from the surface:
- **Rest** → base color
- **Hover** → slightly darker
- **Pressed/Selected** → darker still
- **Focus** → thicker stroke outline (no color change on the fill)

### Accessibility Rules

- Never use color alone to convey meaning — always pair with text, icons, or patterns
- Ensure sufficient contrast between foreground and background
- Support both light and dark modes — Fluent is mode-aware throughout
- Use color tokens (semantic aliases) rather than raw hex values

---

## Elevation

Fluent uses **shadows** to create depth hierarchy. Shadows are composed of a **key shadow** (directional, sharper) and an **ambient shadow** (omnidirectional, softer).

### Shadow Ramp

| Token | Blur | Use For |
|-------|------|---------|
| Shadow 2 | 2px | Cards at rest |
| Shadow 4 | 4px | Cards in grid layouts |
| Shadow 8 | 8px | Floating action buttons, command bars |
| Shadow 16 | 16px | Callouts, hover cards, tooltips |
| Shadow 28 | 28px | Bottom sheets, side navigation panels |
| Shadow 64 | 64px | Pop-up dialogs, modals |

- **Low elevation** (shadow 2–16): Content that sits slightly above the surface. Cards, buttons, toolbars.
- **High elevation** (shadow 28–64): Content that floats above everything. Dialogs, sheets, popovers.

### Shadow Composition

Each shadow level pairs a key shadow and an ambient shadow:
- **Key shadow**: Offset downward, tighter blur, darker opacity — simulates directional light
- **Ambient shadow**: No offset, wider blur, lighter opacity — simulates scattered light

### Colored Surfaces

When placing shadows on colored backgrounds, use the **luminosity blend mode** to maintain a natural shadow appearance. The luminosity equation adjusts shadow opacity relative to the surface color.

### Platform Note

Windows uses **strokes** instead of key shadows in some contexts. When building for Windows-targeted comps, consider using 1px border strokes instead of or alongside shadows for elevation cues.

---

## Iconography

### Icon Collections

| Collection | License | Usage |
|-----------|---------|-------|
| **System icons** | MIT (open source) | UI chrome: navigation, actions, status indicators |
| **Product launch icons** | Microsoft proprietary | App launchers, product branding |
| **File type icons** | Microsoft proprietary | File/document type indicators |

### Two Themes

- **Regular** (outlined): Default for wayfinding, navigation, unselected states
- **Filled** (solid): Selected/active states, emphasis, primary actions

### Size Guidance

| Size | Usage |
|------|-------|
| 12px | Information-only indicators (not interactive) |
| 16px | Compact UI, inline text icons |
| 20px | Standard UI controls |
| 24px | Default for most contexts |
| 28–32px | Touch targets, prominent actions |
| 48px | Large feature icons, empty states |

### Icon Rules

- **One solid color only** on system icons — never multicolor, never gradient
- **Literal metaphors** for naming: "shield" not "security", "person" not "user"
- **Modifiers** go in the bottom-right corner (e.g., badge, plus, checkmark)
- **Never recolor** product launch or file type icons — use them as provided
- Consider localization: avoid culturally specific metaphors, support RTL mirroring where appropriate

### Sourcing

The open-source icon library lives at **[`microsoft/fluentui-system-icons`](https://github.com/microsoft/fluentui-system-icons)** on GitHub (MIT license). It contains ~8,500 system icons as optimized SVGs, available in both `regular` (outlined) and `filled` (solid) styles across sizes 12–48px.

For the full procedural guide on installing, finding, and embedding these icons — including the npm package (`@fluentui/svg-icons`), GitHub raw-URL fallback, filename conventions, and search techniques — read the **Fluent Icons skill** at `.github/skills/design/fluent-icons.md`. That skill is standalone and used by agents independently of this design system skill. This section covers *when and why* to use each icon style; the Fluent Icons skill covers *how* to get the SVG files.

---

## Layout

### Spacing System

Fluent uses a **4px base unit**. All spacing derives from this grid:

| Token | Size |
|-------|------|
| `spacing-none` | 0px |
| `spacing-xxs` | 2px |
| `spacing-xs` | 4px |
| `spacing-s-nudge` | 6px |
| `spacing-s` | 8px |
| `spacing-m-nudge` | 10px |
| `spacing-m` | 12px |
| `spacing-l` | 16px |
| `spacing-xl` | 20px |
| `spacing-xxl` | 24px |
| `spacing-xxxl` | 28px |

Extended ramp continues: 32, 36, 40, 48, 52, 56px.

### Grid System

- **12-column grid** is the standard framework
- Grid anatomy: **columns** (content), **gutters** (between columns), **margins** (outer edges), **regions** (grouped columns)
- Grid types: baseline grid (vertical rhythm), column grid (horizontal layout), manuscript grid (text-heavy), modular grid (cards/tiles)

### Responsive Breakpoints

| Breakpoint | Range | Typical Device |
|------------|-------|----------------|
| Small | 320–479px | Phone portrait |
| Medium | 480–639px | Phone landscape |
| Large | 640–1023px | Tablet |
| X-Large | 1024–1365px | Small desktop/laptop |
| XX-Large | 1366–1919px | Standard desktop |
| XXX-Large | 1920px+ | Large desktop/widescreen |

### Responsive Techniques

Apply these progressively as viewport changes:
1. **Reposition** — move elements to new locations
2. **Resize** — scale elements proportionally
3. **Reflow** — stack or wrap to fit available space
4. **Show/Hide** — reveal or collapse secondary content
5. **Re-architect** — fundamentally restructure the layout for the breakpoint

### Touch Targets

| Platform | Minimum Target Size |
|----------|-------------------|
| iOS / Web | 44 × 44px |
| Android | 48 × 48px |

---

## Material

Fluent defines four surface materials:

| Material | Appearance | Usage | Mode-Aware |
|----------|-----------|-------|------------|
| **Solid** | Opaque color fills | Most common — base surfaces, cards, panels. Uses color and elevation to distinguish regions. | Yes |
| **Acrylic** | Semi-transparent frosted glass | Transient, light-dismiss surfaces: popovers, menus, context menus, flyouts. | Yes |
| **Mica** | Opaque with subtle desktop wallpaper tint | Base layer beneath interactive UI on Windows. Shows active/inactive window state. | Yes |
| **Smoke** | Translucent black overlay | Modal backdrops. Dims the interface beneath to signal blocking interaction. | No (always dark) |

### Material Selection Rules

- **Solid** is the default. Use it unless you have a specific reason for another material.
- **Acrylic** goes on transient surfaces that appear over content and dismiss on click-away. It creates depth without heavy shadows.
- **Mica** is Windows-specific. It samples the user's wallpaper color for a personalized feel. Falls back to neutral when the window is inactive.
- **Smoke** signals that the content below is blocked. Used behind dialogs and modal overlays.

### In Comps

Since comps are vanilla HTML/CSS, simulate materials:
- **Solid**: Standard `background-color` on surfaces
- **Acrylic**: Use `backdrop-filter: blur(20px)` with a semi-transparent background color
- **Smoke**: Use a full-viewport overlay with `background: rgba(0, 0, 0, 0.4)`
- **Mica**: Not applicable in web comps (OS-level feature) — use a neutral solid as fallback

---

## Motion

### Motion Principles

1. **Functional** — Motion serves purpose: identify next steps, communicate changes, celebrate accomplishments
2. **Natural** — Follow physical laws (inertia, gravity, weight, velocity) for believable animation
3. **Consistent** — Unified motion language across Microsoft products
4. **Appealing** — Delightful motion draws people in and creates memorable experiences

### Duration

- Balance between sluggish and abrupt — aim for **fast and smooth**
- Larger elements get more time than smaller ones
- Distance traveled affects duration: farther = longer
- Keep durations short enough that users don't feel like they're waiting

### Easing Functions

| Easing | Behavior | Use For |
|--------|----------|---------|
| **Linear** | Constant speed | Rotations, looping animations only. Feels mechanical. |
| **Ease-in** | Start slow, speed up | Elements leaving the screen |
| **Ease-out** | Start fast, slow down | Elements entering the screen |
| **Ease-in-out** | Slow → fast → slow | Elements moving between positions |

### Transitions

Four primary transition types:
1. **Enter/Exit** — Introduce or dismiss UI elements (menus, dialogs, tooltips). Animate from off-screen or from a trigger point.
2. **Elevation** — Visual depth changes for hover states, drag-and-drop, window focus.
3. **Top level** — Page-to-page navigation. Use quick **fade** transitions — avoid sliding large surfaces around.
4. **Container transform** — Resize or reposition containers for responsive layout changes.

### Choreography

- **Staggering**: Delay the start of successive animations in a group. Use short offsets. Preferred for most list/grid animations. Skip staggering only for very large groups where it would take too long.
- **Hierarchy**: Animate important elements with more prominence (larger movement, longer duration). Group less significant elements with synchronized timing.

### Accessibility

- Include a **"no motion" / reduced motion** setting (respect `prefers-reduced-motion`)
- Keep durations short and movement natural
- Avoid flashes, jarring movements, or stimuli that could trigger seizures
- Constrain motion to the element in focus — don't animate unrelated areas
- Provide non-visual alternatives for motion-conveyed information (ARIA live regions)

### In Comps

Use CSS transitions and animations to demonstrate motion:
```css
/* Ease-out for entering elements */
.element-enter {
    transition: opacity 200ms ease-out, transform 200ms ease-out;
}

/* Respect reduced motion preference */
@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}
```

---

## Shapes

### Forms

| Form | Shape | Usage |
|------|-------|-------|
| **Rectangle** | Standard box | Most components: buttons, text areas, menus, cards, images |
| **Circle** | Perfect round | Avatars, people indicators, status dots |
| **Pill** | Rounded rectangle (full radius) | Tags, keywords, sliders, toggles, selection chips |
| **Beak** | Pointed callout tab | Reference point for floating surfaces: callouts, popovers, tooltips |

Forms are distinguished by **fills** (colored backgrounds) or **borders** (outline only).

### Corner Radius Tokens

| Token | Size | Usage |
|-------|------|-------|
| None | 0px | Navigation bars, tab bars |
| Small | 2px | Small badges, elements < 32px |
| Medium | 4px | Buttons, dropdowns (default for most components) |
| Large | 8px | Large buttons, cards |
| X-Large | 12px | Bottom sheets, popovers |
| Circle | 50% | Avatars, circular indicators |

**Default rule**: Most rectangles use **4px** corner radius. Elements smaller than 32px drop to **2px**. Large/extra-large components use 8px or 12px.

### When to Avoid Rounded Corners

- **Adjacent elements in a container**: Don't round internal edges between split buttons, segmented controls, or grouped items — it creates awkward gaps
- **Screen-edge components**: Elements that touch the viewport edge skip rounding on those edges

### Stroke

| Token | Size (1x) | Size (2x/HiDPI) |
|-------|-----------|-----------------|
| Thin | 1px | 1px |
| Thick | 2px | 2px |
| Thicker | 3px | 4px |
| Thickest | 4px | 6px |

- Scale stroke thickness with element size (smaller element = thinner stroke)
- Use **rounded stroke caps** — avoid square caps
- Dashed strokes follow a proportional pattern based on stroke thickness

---

## Typography

### Font Stack

- **Primary**: Segoe UI (Microsoft's signature typeface)
- **Fallback strategy**: Default to native system fonts per platform for familiarity
  - Windows: Segoe UI
  - macOS: SF Pro / San Francisco
  - iOS: SF Pro
  - Android: Roboto
  - Web: `"Segoe UI", -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif`

### Type Ramp (Web)

| Style | Weight | Size / Line Height |
|-------|--------|--------------------|
| Caption 2 | Regular | 10px / 14px |
| Caption 2 Strong | Semibold | 10px / 14px |
| Caption 1 | Regular | 12px / 16px |
| Caption 1 Strong | Semibold | 12px / 16px |
| Caption 1 Stronger | Bold | 12px / 16px |
| Body 1 | Regular | 14px / 20px |
| Body 1 Strong | Semibold | 14px / 20px |
| Body 1 Stronger | Bold | 14px / 20px |
| Subtitle 2 | Semibold | 16px / 22px |
| Subtitle 2 Stronger | Bold | 16px / 22px |
| Subtitle 1 | Semibold | 20px / 26px |
| Title 3 | Semibold | 24px / 32px |
| Title 2 | Semibold | 28px / 36px |
| Title 1 | Semibold | 32px / 40px |
| Large Title | Semibold | 40px / 52px |
| Display | Semibold | 68px / 92px |

### Styling Rules

- **Sentence case** everywhere — never ALL CAPS for emphasis (hard to read)
- **Left-align** text for LTR languages, **right-align** for RTL
- Center text sparingly — only for short, attention-grabbing copy
- **Baseline alignment** creates consistent vertical rhythm within layouts

### Text Color Hierarchy

- Primary text color for main content → highest prominence
- Brand/accent color on text → increased visual prominence (use sparingly)
- Lighter neutral for secondary text → de-emphasized, lower in hierarchy

### Contrast Requirements

- Standard text: minimum **4.5:1** contrast ratio against background
- Large text (≥ 18.5px bold or ≥ 24px regular): minimum **3:1** contrast ratio

---

## Applying Fluent in Comps

When building comps with Fluent 2 principles, follow this checklist:

### Must-Have

- [ ] Use the Fluent type ramp — pick styles from the table, don't invent arbitrary sizes
- [ ] Use 4px-based spacing throughout — all margins, padding, gaps should be multiples of 4 (or 2 for fine adjustments)
- [ ] Use Fluent corner radius tokens — 4px default, 2px for small elements, 8/12px for large surfaces
- [ ] Use Fluent System Icons (via the Fluent Icons skill) — regular for navigation, filled for selected states
- [ ] Apply shadow ramp for elevation — don't invent shadow values, use the defined ramp
- [ ] Ensure all interactive elements have hover/pressed/focus states following the darker-on-interaction pattern
- [ ] Support `prefers-reduced-motion` with reduced or no animation
- [ ] Use semantic color tokens for states (red = error, yellow = warning, green = success)

### Should-Have

- [ ] Responsive breakpoints from the Fluent ramp (320, 480, 640, 1024, 1366, 1920)
- [ ] Touch-friendly targets (44px minimum on web)
- [ ] Sentence case for all UI text
- [ ] Acrylic effect (`backdrop-filter: blur`) for transient/flyout surfaces
- [ ] Staggered entrance animations for list/grid items

### Nice-to-Have

- [ ] Light and dark mode support via CSS custom properties
- [ ] Smoke overlay for modal dialogs
- [ ] Baseline grid alignment for vertical rhythm
