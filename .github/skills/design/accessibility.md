# Skill: Accessibility (WCAG 2.2)

Practical design guidelines for creating accessible web content. Based on the [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/) W3C Recommendation. This skill covers the AA conformance level — the standard target for most web projects — plus key Level A requirements that are non-negotiable.

Use this skill when building UI comps, choosing colors and typography, designing interactions, laying out forms, or reviewing designs for accessibility compliance. Accessibility is not a polish step — it is a design constraint that must be present from the first comp.

---

## The Four Principles (POUR)

Every WCAG guideline falls under one of four principles:

1. **Perceivable** — Users must be able to perceive the information (it can't be invisible to all their senses)
2. **Operable** — Users must be able to operate the interface (it can't require interactions they can't perform)
3. **Understandable** — Users must be able to understand the information and operation (it can't be beyond their comprehension)
4. **Robust** — Content must be robust enough for diverse user agents and assistive technologies

---

## Color and Contrast

### Text Contrast (1.4.3 — AA)

All text must have a contrast ratio of at least **4.5:1** against its background.

- **Large text** (18pt / 24px regular, or 14pt / 18.5px bold) needs at least **3:1**
- Incidental text (inactive controls, decorative text, logos) is exempt
- This applies to all text — headings, body, labels, placeholders, navigation, buttons

**Practical rules:**
- Never place light gray text on a white background — the most common contrast failure
- Test every text/background pair with a contrast checker before committing to a palette
- Dark mode needs the same contrast ratios — don't assume light-on-dark is automatically accessible
- Placeholder text in inputs must also meet contrast requirements
- For the exact calculation formula and a copy-paste JS utility, read the **Contrast Ratio Calculation skill** (`.github/skills/design/contrast-ratio.md`)

### Non-text Contrast (1.4.11 — AA)

Visual information required to identify UI components and their states must have at least **3:1** contrast against adjacent colors.

- **Borders and outlines** of input fields, buttons, and controls
- **Icons** that convey meaning (not decorative icons)
- **Focus indicators** and selection states
- **Chart elements** — data lines, bars, segments that convey meaning

**Practical rules:**
- A button with only a border (ghost button) must have a 3:1 border contrast
- Icon-only buttons need 3:1 for the icon against its background
- Form fields must be visually identifiable — a subtle bottom-border on a white background may fail
- Custom checkboxes and toggles must meet this threshold in all states

### Don't Use Color Alone (1.4.1 — A)

Color must not be the **only** visual means of conveying information.

- Error states: don't just turn the border red — add an icon and/or text label
- Required fields: don't just use a red asterisk — include a text label like "Required"
- Links in body text: don't just color them — add underline or other non-color indicator
- Status indicators: don't rely solely on green/yellow/red — add text labels or icons
- Charts and graphs: use patterns, labels, or shapes in addition to color

---

## Typography and Readability

### Resize Text (1.4.4 — AA)

Text must be resizable up to **200%** without loss of content or functionality.

- Use relative units (`rem`, `em`, `%`) — not fixed `px` for font sizes
- Don't clip containers — text that grows must not overflow and become hidden
- Test by zooming your browser to 200% and verifying nothing breaks

### Text Spacing (1.4.12 — AA)

Content must tolerate user-adjusted text spacing without breaking:

- Line height at least **1.5× the font size**
- Paragraph spacing at least **2× the font size**
- Letter spacing at least **0.12× the font size**
- Word spacing at least **0.16× the font size**

**Practical rules:**
- Don't set fixed heights on text containers — they will clip when spacing increases
- Avoid `overflow: hidden` on elements containing text
- Test with a browser extension that overrides text spacing to these values

### Visual Presentation (1.4.8 — AAA, but good practice)

Even though AAA, these are widely recommended defaults:

- Line width no more than **80 characters** (40 for CJK)
- Text not fully justified (ragged right is more readable)
- Line spacing at least **1.5×** within paragraphs
- Paragraph spacing at least **1.5× line spacing**

### Images of Text (1.4.5 — AA)

Use real text instead of images of text. Text rendered as an image cannot be resized, reflowed, or read by screen readers without alt text.

- Logos are exempt
- If a specific visual presentation is essential, images of text are allowed — but this is rare

---

## Structure and Semantics

### Info and Relationships (1.3.1 — A)

Structure conveyed visually must also be conveyed programmatically.

- Use proper heading hierarchy (`h1` → `h2` → `h3`) — don't skip levels
- Use `<nav>`, `<main>`, `<header>`, `<footer>`, `<aside>` landmarks
- Use `<ul>`/`<ol>` for lists — don't fake them with `<div>` and bullets
- Use `<table>` with `<th>` for tabular data — not CSS grids pretending to be tables
- Associate form labels with inputs using `<label for="id">` or wrapping
- Group related form fields with `<fieldset>` and `<legend>`

### Meaningful Sequence (1.3.2 — A)

The DOM order must match the visual reading order. Screen readers follow source order, not CSS visual order.

- Don't use `order` in CSS to create a reading sequence that contradicts the DOM
- Tab order should follow visual flow — top to bottom, left to right (in LTR languages)

### Headings and Labels (2.4.6 — AA)

Headings and labels must describe their topic or purpose.

- Don't use vague headings like "Section 1" or "Details"
- Form labels should describe what to enter, not where to enter it
- Every form input needs a visible label — placeholder text alone is insufficient

### Page Titled (2.4.2 — A)

Pages must have titles that describe topic or purpose. In comps, set a meaningful `<title>`.

---

## Keyboard and Focus

### Keyboard Accessible (2.1.1 — A)

All functionality must be operable via keyboard alone.

- Every interactive element must be reachable with Tab
- Buttons, links, form controls, and custom widgets must respond to Enter and/or Space
- Dropdown menus, modal dialogs, and accordions must be keyboard-navigable
- Don't create interactions that require hover/mouse only

### No Keyboard Trap (2.1.2 — A)

If keyboard focus enters a component, it must be possible to leave using keyboard alone.

- Modals must trap focus inside while open, then release it when closed
- Custom widgets that capture focus must provide a clear exit (Escape, Tab out)

### Focus Visible (2.4.7 — AA)

Keyboard focus must have a **visible indicator** at all times.

- Never use `outline: none` or `outline: 0` without providing a replacement focus style
- The default browser focus ring is acceptable — but custom focus styles are better if they're more visible
- Focus styles should have sufficient contrast (3:1 against adjacent colors)
- Focus styles should be consistent across the interface

### Focus Not Obscured (2.4.11 — AA, new in 2.2)

When a component receives keyboard focus, it must not be entirely hidden by author-created content.

- Sticky headers, footers, and floating toolbars must not cover the focused element
- Modals and overlays should not push focus behind them
- Cookie banners and notification bars must not obscure focused content

### Focus Order (2.4.3 — A)

Tab order must preserve meaning and operability.

- Focus should flow logically through the page — matching visual layout
- Don't use `tabindex` values greater than 0 — they break natural tab order
- `tabindex="0"` makes an element focusable; `tabindex="-1"` makes it programmatically focusable but removes it from tab order

---

## Interactive Elements

### Target Size (2.5.8 — AA, new in 2.2)

Interactive targets must be at least **24×24 CSS pixels**.

- Buttons, links, checkboxes, radio buttons, and custom controls
- If the target is smaller than 24px, ensure at least 24px of spacing between it and other targets
- Inline links within text are exempt
- For touch-friendly design, aim for **44×44 CSS pixels** (the AAA target from 2.5.5)

**Practical rules:**
- Icon buttons (close, menu, settings) are frequently too small — size them properly
- Checkbox and radio inputs styled with CSS must maintain sufficient hit area
- Mobile comps especially: generous tap targets prevent misclicks and improve usability

### Pointer Cancellation (2.5.2 — A)

Don't execute actions on mouse/touch down — wait for the up-event, or provide undo.

- Click/tap actions should fire on `click` (up-event), not `mousedown` or `touchstart`
- Drag operations should be cancellable by releasing outside the target

### Dragging Movements (2.5.7 — AA, new in 2.2)

Any functionality that uses drag must also work with a single pointer without dragging.

- Sortable lists: provide up/down buttons as alternative
- Sliders: allow direct input or keyboard control
- Drag-to-reorder: offer a menu or button-based alternative

### Content on Hover or Focus (1.4.13 — AA)

Tooltips and popovers triggered by hover or focus must be:

- **Dismissible** — user can close them without moving focus (usually Escape)
- **Hoverable** — the pointer can move over the tooltip without it disappearing
- **Persistent** — the content stays until hover/focus is removed, user dismisses it, or it's no longer valid

---

## Motion and Animation

### Pause, Stop, Hide (2.2.2 — A)

Moving, blinking, or auto-updating content that starts automatically and lasts more than 5 seconds must have a mechanism to pause, stop, or hide it.

- Auto-playing carousels: provide pause button
- Animated banners: provide a way to stop the animation
- Live-updating feeds: provide a way to pause updates
- Background video: provide pause control

### Three Flashes (2.3.1 — A)

Nothing on the page may flash more than **three times per second**.

- Avoid strobe effects, rapid color cycling, or pulsing animations
- This is a seizure risk — it's a safety issue, not just a preference

### Animation from Interactions (2.3.3 — AAA, but good practice)

Provide a way to disable motion animation triggered by interaction.

- Respect `prefers-reduced-motion` media query
- Parallax scrolling, zoom transitions, and page slide animations should be optional
- Provide a CSS approach: `@media (prefers-reduced-motion: reduce) { * { animation: none !important; transition: none !important; } }`

---

## Forms and Input

### Labels and Instructions (3.3.2 — A)

Provide labels or instructions when input is required.

- Every input needs a visible, associated `<label>`
- Placeholder text is not a label — it disappears on input and has contrast issues
- For complex inputs, provide helper text below the field
- Required fields should be indicated with more than just color (text or icon)

### Error Identification (3.3.1 — A)

When an error is detected, identify the item in error and describe the error in text.

- Don't just add a red border — add a text message explaining what's wrong
- Place error messages near the field they relate to
- Programmatically associate error messages with their inputs using `aria-describedby`

### Error Suggestion (3.3.3 — AA)

When an error is detected and correction suggestions are known, provide them.

- "Invalid email" → "Please enter an email in the format name@example.com"
- "Date required" → "Please enter a date in MM/DD/YYYY format"

### Input Purpose (1.3.5 — AA)

Input fields collecting personal information should use `autocomplete` attributes.

- `autocomplete="name"`, `autocomplete="email"`, `autocomplete="tel"`, etc.
- This helps browsers auto-fill and assists users with cognitive disabilities

---

## Navigation

### Bypass Blocks (2.4.1 — A)

Provide a mechanism to skip repeated blocks of content.

- "Skip to main content" links — the most common pattern
- Should be the first focusable element on the page
- Can be visually hidden until focused

### Consistent Navigation (3.2.3 — AA)

Navigation repeated across pages must appear in the same relative order.

- Don't rearrange nav items between pages
- Adding items is fine — changing order is not

### Link Purpose (2.4.4 — A)

The purpose of each link must be determinable from the link text alone or from context.

- Avoid "click here", "read more", "learn more" without context
- For repeated "Read more" links, use `aria-label` to differentiate: `aria-label="Read more about pricing"`

---

## Responsive and Reflow

### Reflow (1.4.10 — AA)

Content must reflow at 320px wide (equivalent to 400% zoom on a 1280px viewport) without horizontal scrolling.

- Single-column layout at narrow widths
- No horizontal scroll for text content
- Tables and maps are exempt — they may need two-dimensional scrolling

### Orientation (1.3.4 — AA)

Don't lock content to a single orientation (portrait or landscape) unless essential.

---

## ARIA and Semantics

### Name, Role, Value (4.1.2 — A)

All UI components must have programmatically determinable name, role, states, and properties.

- Use native HTML elements when possible — they have built-in roles (`<button>`, `<input>`, `<select>`)
- Custom components need `role`, `aria-label`, `aria-expanded`, `aria-selected`, etc.
- Update ARIA attributes dynamically as state changes (e.g., `aria-expanded="true"` when an accordion opens)

### Status Messages (4.1.3 — AA)

Status messages must be programmatically determinable without receiving focus.

- Success messages: use `role="status"` or `aria-live="polite"`
- Error summaries: use `role="alert"` or `aria-live="assertive"`
- Loading indicators: announce via live region
- Don't move focus to status messages unless essential

---

## Language

### Language of Page (3.1.1 — A)

Set the `lang` attribute on the `<html>` element.

```html
<html lang="en">
```

### Language of Parts (3.1.2 — AA)

When content includes passages in a different language, mark them:

```html
<p>The French word <span lang="fr">bonjour</span> means hello.</p>
```

---

## Accessibility Checklist for Comps

When building or reviewing a comp, verify:

### Color and Contrast
- [ ] All text meets 4.5:1 contrast (3:1 for large text)
- [ ] UI components and icons meet 3:1 non-text contrast
- [ ] No information conveyed by color alone — icons, text, or patterns supplement
- [ ] Focus indicators have 3:1 contrast against adjacent colors

### Typography
- [ ] Font sizes use relative units (rem/em) — no fixed px
- [ ] Body text line height is at least 1.5×
- [ ] Line length stays under 80 characters
- [ ] Text is not justified (ragged right preferred)
- [ ] No images of text (except logos)

### Structure
- [ ] Heading hierarchy is correct (h1 → h2 → h3, no skips)
- [ ] Semantic HTML landmarks used (nav, main, header, footer)
- [ ] Lists use proper list elements
- [ ] DOM order matches visual reading order

### Keyboard and Focus
- [ ] All interactive elements reachable via Tab
- [ ] Visible focus indicator on every focusable element
- [ ] No keyboard traps — focus can always move forward
- [ ] Focus order follows visual layout
- [ ] Sticky elements don't obscure focused content

### Interactive Elements
- [ ] Touch/click targets are at least 24×24px (44×44px preferred)
- [ ] Tooltips are dismissible, hoverable, and persistent
- [ ] Drag interactions have non-drag alternatives
- [ ] Actions execute on pointer up, not pointer down

### Motion
- [ ] Auto-playing content has pause/stop controls
- [ ] No content flashes more than 3 times per second
- [ ] Animations respect `prefers-reduced-motion`

### Forms
- [ ] Every input has a visible associated label
- [ ] Required fields indicated with more than color
- [ ] Error messages are in text, near the field, and descriptive
- [ ] `autocomplete` attributes on personal info fields

### Content
- [ ] `lang` attribute set on `<html>`
- [ ] Link text is descriptive (no bare "click here")
- [ ] Skip navigation link present for repeated content blocks

---

## Source

All guidelines in this skill are derived from the [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/), W3C Recommendation, 12 December 2024. The conformance target is **Level AA** except where noted.
