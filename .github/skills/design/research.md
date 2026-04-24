# Design Research

Investigate design patterns, accessibility standards, competitive products, design systems, and UX best practices. Research provides evidence before committing to a direction — preventing costly redesigns.

**Research is a proactive tool, not a last resort.** Research BEFORE making design decisions when uncertain about user behavior, technical constraints, or best practices.

---

## When to Research

| Situation | Research Needed |
|-----------|-----------------|
| User wants a data table | "How do major design systems handle sort, filter, and pagination?" |
| Accessibility uncertainty | "What are WCAG requirements for autocomplete inputs?" |
| Novel interaction | "How do other products handle inline editing in lists?" |
| Design system choice | "Compare Fluent vs Material for form-heavy applications" |
| User flow complexity | "What are best practices for multi-step wizards?" |

---

## Research Types

### 1. Competitive Analysis

Compare how other products solve the same design problem.

**Questions to answer:**
- How do competitors approach this UI challenge?
- What patterns are users already familiar with?
- What do competitors do well? Poorly?
- Are there innovative approaches worth considering?

**How to conduct:**
- Identify 3-5 relevant competitors or analogous products
- Document their approach with screenshots or descriptions
- Analyze strengths and weaknesses
- Note accessibility considerations

### 2. Accessibility Research

Research WCAG requirements and best practices for specific UI patterns.

**Questions to answer:**
- What WCAG success criteria apply to this pattern?
- How should keyboard navigation work?
- What ARIA attributes are needed?
- How do screen readers interpret this pattern?
- What are common accessibility failures?

**Sources to check:**
- WCAG 2.2 guidelines (w3.org)
- WAI-ARIA Authoring Practices Guide
- A11y Project patterns
- Deque University resources
- Inclusive Components (inclusivecomponents.design)

### 3. Design System Comparison

Compare how different design systems implement a specific component or pattern.

**Questions to answer:**
- How do major design systems approach this component?
- What variations do they offer?
- How do they handle edge cases (loading, error, empty)?
- What accessibility features are built in?
- What customization is supported?

**Systems to compare:**
- Material Design (Google)
- Fluent 2 (Microsoft)
- Carbon (IBM)
- Spectrum (Adobe)
- Lightning (Salesforce)
- Polaris (Shopify)
- Primer (GitHub)
- Apple HIG

### 4. UX Pattern Research

Research established patterns for common UX challenges.

**Common patterns to research:**
- Onboarding and first-run experience
- Empty states
- Error handling and validation
- Loading and progress indicators
- Search and filtering
- Data tables and lists
- Navigation patterns
- Form design
- Modal and overlay patterns
- Notification systems

**Sources:**
- Nielsen Norman Group articles
- Baymard Institute (e-commerce)
- Luke Wroblewski's work (forms, mobile)
- Smashing Magazine UX articles
- UX Collective (Medium)

### 5. Platform & Constraint Research

Research platform conventions and constraints that affect visual design choices.

**Questions to answer:**
- What platform conventions should the UI follow? (iOS vs Android vs web)
- What screen sizes and input methods must be supported?
- What responsive behaviors do users expect?
- What browser CSS support affects visual approaches?

---

## Research Thoroughness

**Do not return the first thing you find.** Cover the reasonable option space:

- **Search broadly first.** Look at multiple sources, not just the top result.
- **Verify claims.** Cross-reference between sources. Check dates — design patterns evolve.
- **Include diverse perspectives.** Academic sources, practitioner blogs, design system docs, accessibility experts.
- **Justify thin results.** If only 2 relevant examples exist, say why.
- **Don't pad with irrelevant examples.** Every item should genuinely answer the research question.

---

## Research Report Structure

Save reports to `.github/reports/research/research-YYYYMMDD-HHMMSS-{topic}.md`:

```markdown
# Research Report: {Topic}

**Report ID**: research-YYYYMMDD-HHMMSS
**Date**: YYYY-MM-DD

## Research Question

> The specific question or set of questions this research answers.

## Summary

> 2-3 sentence executive summary of findings and recommendation.

## Findings

### {Pattern/Product/System A}

- **What it is**: One-line description
- **Source**: URL or reference
- **Approach**: How they solve the problem
- **Strengths**: What works well
- **Weaknesses**: What doesn't work or is limited
- **Accessibility**: How it handles a11y (if relevant)
- **Screenshots/Examples**: Visual references if applicable

### {Pattern/Product/System B}
(same structure)

## Comparison Matrix

| Criteria | Option A | Option B | Option C |
|----------|----------|----------|----------|
| Approach | | | |
| Accessibility | | | |
| Complexity | | | |
| User Familiarity | | | |
| Flexibility | | | |

## Recommendation

> Which approach is best for THIS design problem and why. Reference the design goals and constraints.

## Risks and Considerations

| Risk | Impact | Mitigation |
|------|--------|------------|
| | | |

## Sources

- [Source 1 Name](URL)
- [Source 2 Name](URL)
```

---

## Output Quality

Research reports may be referenced in design documents and exploration reports. Quality standards:

- **Actionable**: Findings should directly inform design decisions
- **Evidence-based**: Claims backed by sources and examples
- **Balanced**: Present multiple perspectives, not just what confirms assumptions
- **Accessible**: Written clearly, no jargon without explanation
- **Visual when helpful**: Include screenshots or diagrams for complex patterns
