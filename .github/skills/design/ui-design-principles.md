# Skill: UI Design Principles

Reference knowledge for designing user interfaces that are intuitive, usable, and consistent. Use this when building UI comps, evaluating interface designs, writing exploration briefs, or discussing UI decisions with the user.

---

## What Are UI Design Principles?

UI design principles are the foundational rules that make digital products easy to use. Good UI feels invisible — users accomplish their goals without thinking about the interface. Bad UI creates friction, confusion, and abandonment.

The goal: help users navigate to the content and features they need, accomplish what they want to do, one interaction at a time.

---

## 7 Core Principles

### 1. Hierarchy

Guide users to the most important information first. Think of every screen like a page in a book — navigational cues remind the user where they are and what matters most.

**Establish hierarchy through:**
- **Font size and weight** — Large and bold text signals importance
- **Contrast** — High-contrast elements draw the eye before low-contrast ones
- **Spacing** — Generous space around an element elevates its importance
- **Placement** — Top and center get seen first; below-the-fold is secondary
- **Color** — Accent colors pull attention to key actions

**Rule**: Be intentional about what the user sees first vs. what they scroll to find. The content hierarchy should reflect what the user cares about most, not what the business wants to push.

### 2. Progressive Disclosure

Don't show everything at once. Reveal information and options as the user needs them, step by step.

- Break complex flows into digestible steps (onboarding, forms, wizards)
- Show only the controls relevant to the current context
- Hide advanced options behind expandable sections or secondary menus
- Always give users orientation — where am I? How many steps remain?

**Why it matters**: Too many options on one screen creates decision paralysis. A long form feels overwhelming; the same fields split across 3 focused steps feels manageable.

**Watch out for**: Hiding things too deep. If users can't find a feature because it's buried behind too many clicks, progressive disclosure has gone too far.

### 3. Consistency

A good interface feels familiar from the first click. Consistent patterns mean users learn the interface once and apply that knowledge everywhere.

**What to keep consistent:**
- Button styles, sizes, and placement
- Navigation patterns and location
- Typography scale and usage
- Color meanings (e.g., red = destructive, blue = primary action)
- Spacing and layout rhythms
- Icon styles and weights
- Interaction behaviors (how things respond to hover, click, focus)

**Rule**: When you deviate from an established pattern, have a strong rationale. Irregular elements add cognitive load — users wonder "why is this different?" instead of focusing on their task.

**Design systems enforce consistency.** Teams with design systems complete design objectives ~34% faster than those without one (Figma research).

### 4. Contrast

Use contrast strategically to direct attention and communicate importance.

**UI contrast applications:**
- **Primary vs. secondary actions** — Primary CTA gets high contrast (bold color, larger size). Secondary actions get subdued treatment (outline, gray, smaller).
- **Destructive actions** — Red on a neutral background immediately signals danger (e.g., "Delete account" in red vs. "Keep account" in gray)
- **Content hierarchy** — Headlines in dark/bold, body text in medium weight, metadata in lighter gray
- **Interactive vs. static** — Clickable elements should look visually distinct from non-interactive content

**Rule**: Contrast isn't just aesthetic — it's functional. If a user can't distinguish the primary action from the secondary one, the contrast is insufficient.

### 5. Accessibility

Design for everyone. Vision impairments affect more than 1 in 4 users worldwide. Accessible design isn't optional — it's a core UI requirement.

**Key accessibility practices:**
- **Color contrast** — Ensure sufficient contrast ratios between text and backgrounds (WCAG AA: 4.5:1 for normal text, 3:1 for large text)
- **Don't rely on color alone** — Use icons, labels, or patterns alongside color to convey meaning (color-blind users can't distinguish red vs. green)
- **Alternative text** — Provide alt text for images and icons that convey meaning
- **Keyboard navigation** — Every interactive element must be reachable and operable via keyboard
- **Touch targets** — Minimum 44×44px for touch interfaces
- **Appropriate padding** — Sufficient spacing between interactive elements to prevent mis-taps
- **Focus indicators** — Visible focus states for keyboard navigation
- **Assistive technology compatibility** — Semantic HTML, ARIA labels, proper heading structure

**Rule**: If a design looks beautiful but someone using a screen reader or keyboard can't navigate it, the design has failed.

### 6. Proximity

Elements that are related should be visually close together. Elements that are unrelated should be separated by space.

**How proximity works in UI:**
- Group related controls together (play/pause/skip on a media player)
- Separate unrelated actions with space (don't put "Delete" next to "Save")
- Use consistent spacing to signal relationships — tighter spacing = more related
- Form labels should be closer to their input than to the next field

**Rule**: Proximity is the fastest way to communicate "these things go together" without needing labels, borders, or explicit grouping.

### 7. Alignment

Clean alignment makes designs feel professional and trustworthy. Misaligned elements feel sloppy — even if users can't articulate why.

**Alignment practices:**
- Use a grid system — it establishes order and makes layout decisions systematic
- Align text to consistent edges (left-align body text in LTR languages)
- Align form labels and inputs to the same vertical axis
- Align related elements to shared invisible lines
- Maintain consistent margins and padding values

**Rule**: A strong grid removes guesswork. When elements snap to a grid, the layout feels intentional even if the user never consciously notices the alignment.

---

## Practical Guidelines

### Make Interfaces Feel Effortless

- Keep navigation consistent across all pages/screens
- Provide clear visual feedback for every interaction (hover states, loading indicators, success/error messages)
- Minimize the number of actions to complete common tasks
- Don't make users remember information — show it where they need it

### Reduce Cognitive Load

- Limit choices visible at one time (progressive disclosure)
- Use familiar patterns — don't reinvent standard interactions (hamburger menu, tab bar, modal dialog)
- Group related information visually
- Use clear, concise labels — avoid jargon unless the audience expects it
- Provide sensible defaults so users don't have to configure everything

### Guide Through Visual Flow

Position elements to create a logical reading sequence:
1. **Entry point** — What the user sees first (hero, headline, key visual)
2. **Supporting context** — What helps them understand (subhead, description)
3. **Action** — What they should do next (CTA, form, navigation)
4. **Details** — Additional information they may want (specs, metadata, fine print)

This sequence should be obvious from the layout alone — if users need instructions to navigate the page, the visual flow has failed.

---

## UI Design Checklist

Before presenting a UI comp, verify:

- [ ] **Hierarchy is clear** — Can the user instantly tell what's most important?
- [ ] **Actions are obvious** — Are interactive elements visually distinct and easy to find?
- [ ] **Primary action stands out** — Is the main CTA clearly the dominant action?
- [ ] **Consistency holds** — Do buttons, spacing, typography, and colors follow established patterns?
- [ ] **Proximity groups correctly** — Are related elements close together and unrelated elements separated?
- [ ] **Alignment is clean** — Are elements snapped to a grid with consistent spacing?
- [ ] **Contrast is sufficient** — Is text readable? Are interactive elements distinguishable?
- [ ] **Accessibility is considered** — Color contrast ratios, touch targets, keyboard navigation, alt text?
- [ ] **Cognitive load is low** — Are there too many choices? Too much information at once?
- [ ] **Feedback is present** — Do interactive elements have hover/active/focus/disabled states?

---

## Quick-Reference Terminology

| Term | Definition |
|------|-----------|
| **Hierarchy** | Visual ordering that guides the eye to important elements first |
| **Progressive disclosure** | Revealing information gradually as the user needs it |
| **Consistency** | Using the same patterns across the entire interface |
| **Contrast** | Visual difference used to direct attention and signal importance |
| **Accessibility** | Designing so everyone can use the interface, including users with disabilities |
| **Proximity** | Placing related elements close together to signal association |
| **Alignment** | Lining elements up along shared edges or grid lines |
| **Cognitive load** | The mental effort required to use the interface |
| **Affordance** | A visual cue that suggests how an element can be interacted with |
| **Design system** | A collection of reusable components and standards for consistent UI |
| **WCAG** | Web Content Accessibility Guidelines — the standard for accessible design |
| **Touch target** | The minimum tappable area for interactive elements (44×44px) |
| **Visual flow** | The natural reading path the eye follows through a layout |
| **Feedback** | Visual response to user actions (hover, loading, success, error states) |
| **Grid system** | A structure of columns and rows used to align and organize elements |
