# Skill: Responsive Breakpoints

Reference knowledge for implementing responsive layouts across device sizes. Use this when writing responsive CSS for comps, choosing breakpoint values, structuring media queries, or advising on layout adaptation strategy.

---

## What Are Breakpoints?

Breakpoints are specific viewport widths where a layout changes to better fit the screen. They're implemented via CSS media queries and determine when content reflows, elements resize, or navigation restructures.

**Goal**: One design that works everywhere — not separate designs crammed into different screens.

---

## Types of Breakpoints

Not all breakpoints serve the same purpose. Understanding the types helps you choose the right strategy.

| Type | Based On | Example |
|------|----------|--------|
| **Content-based** | Where the layout visually breaks or becomes misaligned | Text line length exceeds 75 characters at 900px — add a breakpoint |
| **Layout** | Structural changes to page-level elements (grids, columns, navigation) | Switch from single-column to three-column at 768px |
| **Component** | Individual component adaptation, independent of page layout | A card switches from vertical to horizontal at 400px container width |
| **Orientation** | Portrait vs. landscape mode changes | Hero image height adjusts in landscape |
| **Interaction-based** | Input method differences (touch vs. cursor) | Enlarge touch targets and remove hover-dependent UI on touch devices |

**Prefer content-based breakpoints.** Don't set breakpoints at device-specific widths ("iPad is 768px"). Instead, resize your design and add a breakpoint where the content actually breaks. This produces layouts that work on devices that don't exist yet.

---

## Standard Breakpoint Ranges

These are widely-used ranges. Adjust based on your project's analytics, but these work as sensible defaults.

| Label | Width | Target Devices | Typical Layout |
|-------|-------|----------------|----------------|
| **Extra Small** | < 576px | Smartphones (portrait) | Single column, stacked content, hamburger nav |
| **Small** | ≥ 576px | Smartphones (landscape), small tablets | Single or two-column, slightly wider content areas |
| **Medium** | ≥ 768px | Tablets (portrait) | Two-column layout, expanded navigation |
| **Large** | ≥ 992px | Tablets (landscape), laptops | Three-column layout, sidebar navigation |
| **Extra Large** | ≥ 1200px | Desktops | Full multi-column layout, detailed content presentation |
| **XXL** | ≥ 1400px | Large desktops, high-res monitors | Max-width containers, generous whitespace |

### Keep It Simple

**Use 3–5 breakpoints maximum.** More breakpoints means more complexity, more CSS to maintain, and more edge cases to test. Only add a breakpoint when the content genuinely breaks — not because a new device size exists.

---

## What Changes at Each Breakpoint

When a breakpoint fires, these are the elements that typically adapt:

| Element | Mobile | Desktop |
|---------|--------|---------|
| **Navigation** | Hamburger menu or slide-out drawer | Horizontal bar with all items visible |
| **Columns** | Single column, vertically stacked | Multi-column (2–4), content side by side |
| **Typography** | Smaller font sizes, tighter spacing | Larger fonts, more generous spacing |
| **Images/Media** | Full-width, stacked, optimized for load time | Larger sizes, grid/gallery layouts |
| **Content priority** | Key content only; secondary info hidden or deferred | Full content visible with sidebars and supplementary sections |
| **Grid/Flexbox** | Simplified single-axis layouts | Complex multi-row, multi-column grids |
| **Buttons/Links** | Enlarged, spaced for touch (≥ 44×44pt) | Smaller, more closely spaced |
| **Forms** | Single-column, large input fields | Multi-column, side-by-side fields |

Use this table as a checklist when planning what each breakpoint should change. Not every element needs to change at every breakpoint — only adjust what the content demands.

---

## Mobile-First vs. Desktop-First

### Mobile-First (Recommended)

Write base styles for the smallest screen, then use `min-width` media queries to layer on complexity for larger screens.

```css
/* Base: mobile styles */
.container { padding: 1rem; }

/* Tablet and up */
@media (min-width: 768px) {
  .container { padding: 2rem; }
}

/* Desktop and up */
@media (min-width: 1200px) {
  .container { max-width: 1140px; margin: 0 auto; }
}
```

**Why mobile-first wins:**
- Forces you to prioritize content and actions
- Base CSS is lighter (mobile devices download less)
- Progressive enhancement — add complexity as screen space allows
- Aligns with how most users access the web (mobile-majority traffic)

### Desktop-First

Write base styles for desktop, then use `max-width` media queries to simplify for smaller screens. This approach works for admin dashboards or internal tools where desktop is the primary context, but is generally not recommended for public-facing sites.

---

## Fluid Design Techniques

Breakpoints handle the big layout shifts, but **fluid techniques handle everything in between** so the design doesn't just snap from one fixed layout to another.

### Fluid Grids

Use percentages or fractional units instead of fixed pixel widths.

```css
/* Fixed (brittle) */
.sidebar { width: 300px; }

/* Fluid (flexible) */
.sidebar { width: 25%; }

/* CSS Grid (modern) */
.layout { display: grid; grid-template-columns: 1fr 3fr; }
```

### Fluid Typography

Scale font sizes with the viewport so text stays readable across sizes.

```css
/* Clamp: minimum, preferred, maximum */
h1 { font-size: clamp(1.5rem, 4vw, 3rem); }
body { font-size: clamp(1rem, 2.5vw, 1.25rem); }
```

### Flexible Images

Images should fill their container without overflow or distortion.

```css
img {
  max-width: 100%;
  height: auto;
}
```

For art direction (different crops at different sizes), use the `<picture>` element or `srcset`:

```html
<picture>
  <source media="(min-width: 768px)" srcset="hero-wide.webp">
  <img src="hero-narrow.webp" alt="Hero image">
</picture>
```

---

## Container Queries (Modern Approach)

Container queries let components respond to **their parent's size** rather than the viewport. This makes components truly reusable — they adapt based on where they're placed, not what device they're on.

```css
.card-container { container-type: inline-size; }

@container (min-width: 400px) {
  .card { display: flex; flex-direction: row; }
}

@container (max-width: 399px) {
  .card { display: flex; flex-direction: column; }
}
```

**When to use container queries vs. media queries:**
- **Media queries**: Page-level layout shifts (navigation, column count, overall structure)
- **Container queries**: Component-level adaptation (card layouts, widget arrangements)

---

## Media Query Best Practices

### Order and Organization

Group media queries by breakpoint, not by component. This keeps the cascade predictable.

```css
/* Base styles (mobile) */
/* ... all mobile styles ... */

@media (min-width: 768px) {
  /* ... all tablet overrides ... */
}

@media (min-width: 1200px) {
  /* ... all desktop overrides ... */
}
```

### Use Relative Units for Breakpoints

`em`-based breakpoints respect user font-size preferences (accessibility win):

```css
/* 768px / 16px = 48em */
@media (min-width: 48em) { ... }
```

### Avoid Overlapping Ranges

Don't create gaps or overlaps between breakpoints:

```css
/* BAD — gap between 767 and 768, overlap potential */
@media (max-width: 767px) { ... }
@media (min-width: 768px) { ... }

/* GOOD — clean boundary with mobile-first */
/* Base = mobile */
@media (min-width: 768px) { /* tablet+ */ }
```

### Store Breakpoints as Variables

Centralize breakpoint values so they're consistent across the codebase and easy to update:

```scss
// SCSS variables
$breakpoint-sm: 576px;
$breakpoint-md: 768px;
$breakpoint-lg: 992px;
$breakpoint-xl: 1200px;

@media (min-width: $breakpoint-md) { ... }
```

```css
/* CSS custom properties */
:root {
  --bp-sm: 576px;
  --bp-md: 768px;
  --bp-lg: 992px;
  --bp-xl: 1200px;
}
```

Use clear naming conventions (`$breakpoint-md`, `--bp-tablet`, `BP_LARGE`) so the purpose of each value is obvious to future maintainers. Add comments when a breakpoint exists for a non-obvious reason.

### Separate Layout vs. Component Breakpoints

- **Layout breakpoints** (global): Control page-level structure — column count, navigation style, sidebar visibility. These are your 3–5 standard breakpoints.
- **Component breakpoints** (local): Control individual component adaptation — a card switching orientation, a widget collapsing. Use container queries or component-scoped media queries for these.

Keep them distinct. Global breakpoints go in your main stylesheet or layout files. Component breakpoints live with the component.

---

## Orientation and Resolution

### Orientation

Use orientation queries sparingly — most layout issues are better solved by width alone. But orientation is useful for specific cases:

```css
/* Landscape-specific adjustments */
@media (min-width: 576px) and (orientation: landscape) {
  .hero { height: 60vh; }
}
```

### High-DPI / Retina

Serve higher-resolution images to high-density screens:

```css
@media (-webkit-min-device-pixel-ratio: 2),
       (min-resolution: 192dpi) {
  .logo { background-image: url('logo@2x.png'); }
}
```

Or use `srcset` for automatic resolution switching:

```html
<img src="photo.jpg"
     srcset="photo.jpg 1x, photo@2x.jpg 2x"
     alt="Photo">
```

---

## Performance Considerations

Responsive design affects performance. Every breakpoint you add is more CSS to parse.

- **Minimize breakpoints** — Only add one when the layout genuinely breaks
- **Compress images** — Use WebP/AVIF; serve appropriate sizes per breakpoint
- **Lazy-load below the fold** — Don't load what the user can't see yet
- **Critical CSS** — Inline above-the-fold styles; defer the rest
- **Avoid loading unused assets** — Don't download desktop-only resources on mobile
- **Test on real devices** — Simulators miss network speed, touch responsiveness, and rendering quirks

---

## Common Mistakes

| Mistake | Why It's a Problem | Fix |
|---------|-------------------|-----|
| Too many breakpoints | Complex CSS, hard to maintain, diminishing returns | Limit to 3–5; add only when content breaks |
| Desktop-first for public sites | Bloated base CSS for mobile users, poor performance | Start mobile-first with `min-width` queries |
| Fixed pixel widths | Layouts break between breakpoints | Use fluid grids (%, fr, flex) with breakpoints for structure shifts |
| Ignoring content reflow | Content looks fine at breakpoints but breaks in between | Use fluid techniques so content scales smoothly between breakpoints |
| No real-device testing | Simulator misses touch, performance, and rendering issues | Test on actual phones/tablets across sizes |
| Breakpoints based on devices | Targets specific models; misses everything in between | Set breakpoints where your content breaks, not at device widths |

---

## Responsive Breakpoint Checklist

Before finalizing a responsive layout, verify:

- [ ] **Mobile-first** — Base styles target the smallest viewport; `min-width` queries layer up
- [ ] **3–5 breakpoints max** — Each one exists because the content demands it
- [ ] **Fluid between breaks** — Grids, typography, and images scale smoothly between breakpoints
- [ ] **No content overflow** — Nothing horizontally scrolls or gets clipped at any width
- [ ] **Readable typography** — Text is legible at every breakpoint; line length stays comfortable (45–75 characters)
- [ ] **Images responsive** — Properly sized per breakpoint; no oversized downloads on mobile
- [ ] **Navigation adapts** — Menu structure changes appropriately for each breakpoint
- [ ] **Touch targets maintained** — Interactive elements stay ≥ 44×44pt at all sizes
- [ ] **Orientation works** — Layout doesn't break when device rotates
- [ ] **Tested on real devices** — Not just browser dev tools

---

## Quick-Reference Terminology

| Term | Definition |
|------|-----------|
| **Breakpoint** | A viewport width at which the layout changes via a media query |
| **Media query** | CSS rule that applies styles conditionally based on viewport characteristics |
| **Mobile-first** | Strategy of writing base CSS for small screens, enhancing upward with `min-width` |
| **Desktop-first** | Strategy of writing base CSS for large screens, simplifying downward with `max-width` |
| **Fluid grid** | Layout using relative units (%, fr) that scales proportionally with the viewport |
| **Fluid typography** | Text sizing that scales with viewport width (via `clamp()`, `vw`, etc.) |
| **Container query** | CSS rule that applies styles based on a parent container's size, not the viewport |
| **Viewport** | The visible area of a web page on the user's screen |
| **DPI / PPI** | Dots/pixels per inch — the pixel density of a screen |
| **Retina / HiDPI** | High-density screens (≥2x pixel ratio) requiring higher-resolution assets |
| **srcset** | HTML attribute that lets the browser choose the best image source for the screen |
| **Critical CSS** | The minimal CSS needed to render above-the-fold content, inlined for performance |
| **Lazy loading** | Deferring the load of off-screen content until the user scrolls to it |
| **Content-based breakpoint** | A breakpoint set where the content visually breaks, not at a device width |
| **Layout breakpoint** | A global breakpoint controlling page-level structure (columns, nav, sidebar) |
| **Component breakpoint** | A local breakpoint controlling an individual component's adaptation |
