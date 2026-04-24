# Skill: Design Composition

Reference knowledge for arranging visual elements into effective, intentional layouts. Use this when building comps, evaluating designs, or discussing layout and visual structure with the user.

---

## What Is Composition?

Composition is the arrangement of visual elements to create harmony, guide attention, and communicate a message. Good composition makes a design feel intentional — every element has a purpose and a place. Bad composition feels cluttered, confusing, or invisible (the eye glazes over it).

---

## 7 Core Principles

### 1. Balance

Distributing visual weight so the design feels stable.

**Symmetrical balance**: Elements are mirrored across a center axis. Clean, formal, classic. Good for interfaces that need to feel orderly and trustworthy.

**Asymmetrical balance**: Uneven distribution that still feels balanced. A large element on one side offset by smaller elements on the other. Modern, dynamic, energetic. More visually interesting but harder to execute.

**How to use it**: When using asymmetry, offset a bold/large element with several smaller, lighter elements. This creates balance without predictability.

### 2. Visual Hierarchy

Guiding the viewer's eye to the most important elements first, then second, then third. Hierarchy is established through:

- **Size**: Larger elements are seen first
- **Placement**: Top-left (in LTR layouts) gets attention first; center commands focus
- **Contrast**: High-contrast elements pull the eye
- **Color**: Saturated or warm colors advance; muted or cool colors recede
- **Weight**: Bold text, thick borders, and solid fills read before light/thin elements

**How to use it**: Design the headline at roughly double the size of the subhead. Scale body text down further. Use a contrasting accent color for the primary call-to-action.

### 3. Contrast

Creating visual difference between elements to establish emphasis and readability. Contrast can come from:

- **Color**: Light vs. dark, warm vs. cool, saturated vs. muted
- **Size**: Large vs. small
- **Weight**: Bold vs. light typography
- **Shape**: Geometric vs. organic, angular vs. rounded
- **Texture**: Smooth vs. rough, flat vs. dimensional
- **Typography**: Serif vs. sans-serif, structured vs. handwritten

**How to use it**: Go beyond just color contrast. Pair a sleek sans-serif with a handwritten script. Mix flat UI elements with subtle shadows. Contrast in multiple dimensions creates richer designs.

### 4. Repetition

Reusing visual elements (colors, shapes, spacing, icons, patterns, typography) to create consistency and rhythm. Repetition builds familiarity and reinforces the design's identity.

**How to use it**: Repeat design elements like icons, shapes, or colors across the layout — even in unexpected places. This keeps the design cohesive while creating pleasant rhythm. In UI: consistent button styles, consistent card layouts, consistent icon weights.

### 5. Emphasis (Focal Point)

Every design needs a star — the one element the viewer should see first. Emphasis ensures the most important element dominates without competing.

**How to use it**: Surround the focal point with generous white space. This creates instant emphasis without flashy effects. Reduce visual noise around the key element — sometimes removing things is more powerful than adding them.

### 6. Unity

Every element should feel like it belongs to the same design. Unity comes from consistency in:

- Color palette (3-5 colors max)
- Typography (1-2 font families)
- Spacing rhythm (consistent padding/margins)
- Visual style (consistent border radii, shadow depths, icon weights)

**How to use it**: Stick to a limited, consistent set of design tokens. If the card has 8px radius, every card has 8px radius. If the primary CTA is blue, every primary CTA is blue. Unity is discipline.

### 7. Proportion and Scale

The relative size of elements to each other. Proportion creates hierarchy, contrast, and visual harmony.

**How to use it**: Use oversized elements strategically — a hero image or bold headline — to grab attention. Then balance with smaller, detailed elements that draw the viewer in. Avoid making everything the same size — similar scale = flat hierarchy = nothing stands out.

---

## Composition Techniques

### Gestalt Principles

The brain groups visual elements automatically. Use this to your advantage:

- **Proximity**: Elements placed close together are perceived as related. Group related items; separate unrelated ones.
- **Similarity**: Elements that look alike (same color, shape, size) are perceived as belonging together.
- **Closure**: The brain fills in gaps — you can suggest shapes without drawing them completely (e.g., negative space logos, implied borders).
- **Continuity**: The eye follows lines and curves. Align elements along invisible lines to create flow.

### Geometric vs. Visual Center

The geometric center of a layout is the mathematical middle. The **visual center** is slightly above that — roughly 1/3 from the top. Placing key elements at the visual center feels more natural and balanced than dead center.

### Static vs. Dynamic Composition

**Static**: Structured, grid-aligned, stable. Elements sit on clear horizontal and vertical axes. Best for: professional, corporate, formal contexts. Communicates reliability and order.

**Dynamic**: Angled, overlapping, energetic. Elements break the grid, use diagonals, or overlap boundaries. Best for: creative, youthful, action-oriented contexts. Communicates energy and movement.

Choose based on the mood the design needs to convey. Most UI comps will lean static, but hero sections, landing pages, and marketing components can benefit from dynamic composition.

### Open vs. Closed Composition

**Open**: Elements extend beyond the frame or imply continuation. Feels expansive, immersive, and inviting. Good for lifestyle scenes, hero sections, and immersive experiences.

**Closed**: All elements are contained within the frame. Self-sufficient and focused. Good for cards, modals, contained UI components, and formal layouts.

---

## White Space (Negative Space)

White space is not wasted space — it's an active design element. It:

- Creates breathing room between elements
- Establishes emphasis by isolating focal points
- Improves readability by preventing visual overload
- Communicates sophistication and confidence (the design doesn't need to fill every pixel)

**Rule of thumb**: When a design feels cluttered, the answer is usually to remove elements or add spacing — not to rearrange them.

---

## Applying Composition to Comps

When building design comp variations, use these principles as variation dimensions:

| Dimension | Variation A | Variation B |
|-----------|-------------|-------------|
| **Balance** | Symmetrical, centered | Asymmetric, offset |
| **Hierarchy** | Large headline, stacked | Smaller headline, side-by-side |
| **Contrast** | High contrast, bold | Low contrast, subtle |
| **Density** | Spacious, generous whitespace | Compact, information-dense |
| **Composition** | Static, grid-aligned | Dynamic, angled/overlapping |
| **Framing** | Closed, contained in cards | Open, bleeding to edges |

Don't just change colors between comps — vary the **compositional strategy** so each comp represents a genuinely different design approach.

---

## Composition Checklist

Before presenting a comp, verify:

- [ ] **Focal point is clear** — Can the viewer instantly identify the most important element?
- [ ] **Hierarchy reads correctly** — Does the eye travel in the intended order? (headline → supporting text → CTA → details)
- [ ] **Balance feels right** — Does the design feel stable, or does one area feel heavy/empty?
- [ ] **Contrast is sufficient** — Are key elements distinguishable? Is text readable against its background?
- [ ] **Repetition creates rhythm** — Are recurring elements (buttons, cards, icons) consistent?
- [ ] **Unity holds** — Does every element feel like it belongs to the same design?
- [ ] **White space is intentional** — Is there breathing room, or does the design feel cramped?
- [ ] **Scale creates interest** — Is there meaningful size variation, or does everything compete equally?

---

## Quick-Reference Terminology

| Term | Definition |
|------|-----------|
| **Balance** | Distribution of visual weight across a layout |
| **Symmetry** | Mirror-image balance across a center axis |
| **Asymmetry** | Uneven distribution that still feels balanced |
| **Visual hierarchy** | The order in which the eye reads elements |
| **Contrast** | Difference between elements that creates emphasis |
| **Repetition** | Reuse of visual elements for consistency and rhythm |
| **Emphasis** | Making the focal point dominate the design |
| **Unity** | Consistency that makes every element feel related |
| **Proportion** | Relative size of elements to each other |
| **Focal point** | The single most important element in the design |
| **White space** | Empty space used as an active design element |
| **Gestalt** | Perceptual psychology principles (proximity, similarity, closure, continuity) |
| **Visual center** | Slightly above geometric center — feels more natural |
| **Static composition** | Grid-aligned, stable, structured |
| **Dynamic composition** | Angled, energetic, breaks the grid |
| **Open composition** | Elements extend beyond the frame |
| **Closed composition** | All elements contained within the frame |
