# Skill: Typography

Reference knowledge for making typographic decisions in UI design. Use this when choosing fonts, setting sizes and spacing, establishing type hierarchy, evaluating readability, or building comps that involve text-heavy layouts.

---

## Why Typography Matters

Typography is the primary vehicle for content. On mobile especially, where screen space is limited and attention spans are short, typographic choices directly impact whether users can read, navigate, and interact with the interface. Poor typography creates friction; good typography is invisible — users absorb content without thinking about the text itself.

---

## Choosing a Typeface

### Serif vs. Sans-Serif

| Category | Characteristics | Best For |
|----------|----------------|----------|
| **Serif** | Decorative strokes on letterforms; thick/thin contrast; traditional feel | Long-form reading, editorial content, brands conveying authority or elegance |
| **Sans-serif** | Clean, simple letterforms; uniform stroke width; modern feel | UI elements, mobile screens, small sizes, low-resolution displays |

**For mobile and UI work, sans-serif is the safer default.** Clean letterforms read well at small sizes on screens. Serif fonts work when screen resolution is high and the brand calls for it.

Avoid overly stylized or decorative fonts (scripts, display faces, Old English). They're hard to read at small sizes and fail on screens.

### System Typefaces

Platform system fonts are designed for their screens and come with no loading cost:
- **iOS**: San Francisco (SF Pro, SF Compact)
- **Android**: Roboto
- **Windows**: Segoe UI
- **Web fallback**: system-ui, -apple-system, sans-serif

Using system fonts guarantees readability on the target platform and loads instantly.

### Imposter Letters

Before committing to a font, check for character confusion. Some fonts make these characters nearly identical:
- Capital **I** vs. lowercase **l** vs. number **1**
- Capital **O** vs. number **0**

This is especially problematic for authentication codes, serial numbers, or any content users need to read precisely. Choose fonts where every character is visually distinct.

**Good examples**: Verdana, Proxima Nova, Roboto — all have distinct letterforms for commonly confused characters.

---

## Font Sizing

### The Core Rule

**Minimum 16px for body copy.** Anything smaller strains readability on mobile screens.

### Type Scale

Use a consistent ratio to scale from body to headings:

| Element | Size Guideline | Example at 16px body |
|---------|---------------|---------------------|
| **Body copy** | 16px minimum | 16px |
| **Subheading** | ~1.2–1.3× body | 19–21px |
| **Heading** | ~1.3× body (or 1.618× using golden ratio) | 21px (or 26px) |
| **Display / Hero** | 2–3× body | 32–48px |
| **Caption / Metadata** | 0.75–0.875× body | 12–14px |
| **Minimum for any text** | 12px absolute floor | 12px |

**Tools**: Use [Typescale](https://typescale.com/) to visualize and generate a consistent scale for your project.

### Don't Over-Size

On mobile, oversized text wastes precious screen space and forces excessive scrolling. The goal is text large enough to read comfortably and tap accurately — not text that dominates the viewport.

---

## Line Spacing (Leading)

Line spacing controls readability and visual rhythm. Different content types need different spacing.

| Content Type | Line Height | Why |
|-------------|-------------|-----|
| **Body copy** | 1.5–1.6× font size | Generous spacing reduces eye fatigue and prevents crowding |
| **Subheadings** | 1.4× font size | Slightly tighter than body; still needs breathing room |
| **Headings** | 1.2× font size | Tight leading groups multi-line headings as a single visual unit |
| **All-caps headings** | Line gap ≈ 1–1.2× stem width | Keeps uppercase text cohesive without looking cramped |

**Rule of thumb**: If lines of text feel like they're merging together, increase the leading. If they feel disconnected, tighten it.

---

## Typographic Hierarchy

Hierarchy tells users what to read first, what's secondary, and what's supporting detail. Establish it through:

### 1. Size

The most direct hierarchy signal. Bigger = more important. Use your type scale consistently — don't invent sizes ad hoc.

### 2. Weight

- **Bold / Semibold**: Headings, emphasis, CTAs
- **Medium**: Body copy (preferred over Regular/Light for mobile readability)
- **Regular / Light**: Secondary text, captions, metadata

**Tip**: On mobile, favor medium weight over light/regular for body text. Thin strokes disappear on small, bright screens.

### 3. Color and Contrast

- Primary text: High contrast against background (near-black on white, or white on dark)
- Secondary text: Reduced contrast (gray tones)
- Interactive text: Accent color (links, CTAs)
- Disabled text: Very low contrast

Ensure all text meets WCAG AA contrast ratios (4.5:1 for normal text, 3:1 for large text).

### 4. Case

- **Sentence case**: Default for most UI text — natural, easy to read
- **Title Case**: Headings and navigation items
- **ALL CAPS**: Sparingly — buttons, labels, very short headings. All caps reduces readability for longer text and can be misread by screen readers

### 5. Eyebrow Text

A short label above a heading that provides context or categorization (e.g., "NEW FEATURE" above "Introducing Dark Mode"). Eyebrow text:
- Draws attention to the heading below it
- Helps users scan and categorize content quickly
- Should be small, uppercase, and in a secondary color or weight

---

## Font Pairing

### Single Typeface (Recommended for Mobile)

Using one typeface with different weights and sizes is the simplest way to maintain consistency:
- **Bold** for headings
- **Medium** for body
- **Regular** for captions and metadata

This approach loads faster (one font family), is always harmonious, and is easier to maintain.

### Two Typefaces

If the brand requires two fonts, pair them with clear contrast:
- **Serif heading + sans-serif body** (classic pairing)
- **Display heading + neutral body** (editorial feel)

**Rules for pairing:**
- Each font must have a distinct role (heading vs. body) — never use two fonts interchangeably
- Ensure sufficient visual contrast between the pair
- Limit to two typefaces maximum on mobile — more creates visual noise and slows loading
- Define the pairing in a typographic system (which font, weight, size, and spacing for each content type)

---

## Spacing and Layout

### Letter Spacing (Tracking)

- **Body text**: Use the font's default tracking — don't adjust unless there's a readability problem
- **All-caps text**: Add positive tracking (+0.5–1.5px) to improve legibility
- **Large display text**: May benefit from slight negative tracking for visual cohesion

### Word Spacing

Leave at default in almost all cases. Adjusted word spacing usually hurts more than it helps.

### Line Length

- **Mobile portrait**: Rarely a problem due to narrow viewport
- **Mobile landscape / tablet**: Limit to **45–75 characters** per line (including spaces)
- **Desktop**: Same 45–75 character guideline; use max-width containers to prevent lines from stretching too wide

Lines that are too long cause readers to lose their place. Lines that are too short create excessive line breaks and fragmented reading.

### Margins and Padding

Give text room to breathe:
- Adequate margins between text blocks and screen edges
- Clear spacing between headings and body copy (heading should be closer to the content it introduces than to the content above it — proximity principle)
- Consistent vertical rhythm throughout the page

---

## Accessibility

### Screen Readers

Screen readers can struggle with:
- **Serif fonts and italics** — Letterforms that are close together or overlap
- **All caps** — May be read letter-by-letter depending on the reader
- **Very thin / light weights** — Hard for low-vision users even with magnification

**Recommended for screen reader compatibility**: Humanist sans-serif typefaces with large x-heights, ample open space, and unique letter shapes — Calibri, Verdana, Tahoma, Proxima Nova.

### Low Vision and Dyslexia

- Offer a manual font-size adjustment option when possible
- Support dark mode with sufficient text/background contrast
- Avoid justified text alignment — uneven word spacing hurts readability
- Use left-aligned text (for LTR languages) — centered body text is harder to track line-to-line

### Contrast Requirements

| Text Type | Minimum Contrast Ratio (WCAG AA) |
|-----------|-------------------------------|
| Normal text (< 18px) | 4.5:1 |
| Large text (≥ 18px or ≥ 14px bold) | 3:1 |
| UI components and graphical objects | 3:1 |

---

## Typography Checklist

Before presenting a comp or finalizing type decisions, verify:

- [ ] **Body text ≥ 16px** — Readable without zooming on mobile
- [ ] **Hierarchy is clear** — Can you tell heading from body from caption at a glance?
- [ ] **Weight is appropriate** — Medium or heavier for body on mobile; no ultra-light body text
- [ ] **Line height is set** — ~1.5–1.6× for body, ~1.2× for headings
- [ ] **Line length controlled** — 45–75 characters in landscape/tablet/desktop
- [ ] **Font renders clearly** — No imposter letters; characters are distinct
- [ ] **Contrast passes** — Text meets WCAG AA ratios against its background
- [ ] **Max 2 typefaces** — One is preferred; two if brand requires it
- [ ] **Spacing is consistent** — Vertical rhythm, margins, and padding follow a system
- [ ] **Touch targets respected** — Tappable text (links, buttons) meets 44×44pt minimum
- [ ] **Tested on device** — Text looks right on an actual phone screen, not just in a design tool

---

## Quick-Reference Terminology

| Term | Definition |
|------|-----------|
| **Typeface** | A family of fonts sharing a common design (e.g., Roboto) |
| **Font** | A specific weight and style within a typeface (e.g., Roboto Medium Italic) |
| **Serif** | A typeface with small decorative strokes at the ends of letterforms |
| **Sans-serif** | A typeface without decorative strokes; clean, simple letterforms |
| **x-height** | The height of lowercase letters (specifically "x"); larger x-height = better readability at small sizes |
| **Leading** | The vertical space between lines of text (line height) |
| **Tracking** | The uniform spacing between all characters in a block of text |
| **Kerning** | The spacing between specific pairs of characters |
| **Type scale** | A set of harmonious font sizes derived from a consistent ratio |
| **Golden ratio** | The ratio 1:1.618, sometimes used to scale heading size relative to body |
| **Eyebrow text** | A short label above a heading that provides context or categorization |
| **Typographic system** | A defined set of rules for typeface, size, weight, spacing, and color across all content types |
| **Fluid typography** | Text sizing that scales with viewport width (via `clamp()`, `vw` units, etc.) |
| **WCAG** | Web Content Accessibility Guidelines — the standard for accessible design |
