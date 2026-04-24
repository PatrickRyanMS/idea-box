# Skill: Salesforce Lightning Design System (SLDS 2)

Procedural knowledge for designing UI comps that follow **Salesforce's Lightning Design System 2 (SLDS 2)**. Use this skill when the user explicitly requests Salesforce/Lightning-style designs, or during blue-sky ideation when SLDS is a relevant design direction.

**Canonical source**: https://www.lightningdesignsystem.com/

This skill synthesizes the SLDS 2 design language: design philosophy, color, typography, spacing, elevation, shapes, iconography, interaction states, and tokens.

---

## Design Philosophy

SLDS 2 is built on the **Salesforce Cosmos** visual design language, guided by five principles:

1. **Clarity** — Clear, understandable design that reduces cognitive load for complex business workflows
2. **Innovation** — Modern UI patterns including AI-ready components ("Agentic Experiences")
3. **Scalability** — Styling hooks decouple visual style from component structure
4. **Empowerment** — No-code theming enables admin-level customization
5. **Inspiration** — Beautiful, purposeful design that makes enterprise software feel modern

SLDS 2 represents a major architectural shift from SLDS 1 — moving from Sass design tokens to **CSS custom properties** ("styling hooks").

---

## Color

### 3-Tier Architecture

| Tier | Description | Mutability |
|------|-------------|-----------|
| **Semantic UI Colors** | Role-based hooks — what the color is for | Mutable (change with theme) |
| **System Palette** | Accessible colors named by intended use | Mutable |
| **Color Palette** | Full spectrum named by color, not use | Constant (never change) |

Always use **semantic hooks** in comps — they adapt automatically to theming.

### Semantic Color Hooks

| Hook Pattern | Purpose |
|--------------|---------|
| `--slds-g-color-surface-*` | Surface/background colors |
| `--slds-g-color-accent-*` | Accent/interactive colors |
| `--slds-g-color-container-*` | Container backgrounds |
| `--slds-g-color-on-*` | Text/icon on specific backgrounds |
| `--slds-g-color-error-*` | Error/destructive states |
| `--slds-g-color-success-*` | Success states |
| `--slds-g-color-warning-*` | Warning states |

### "On" Colors

Every surface/accent/feedback color has a paired `on-*` token for text and icons. Example: `--slds-g-color-on-accent-1` for text placed on an accent background.

### Numeric Ranges

All hooks use **numeric ranges (1–100)**: lowest = lightest, highest = darkest.

### Key Colors

| Role | Default | Usage |
|------|---------|-------|
| **Surface** | White/light gray | Page backgrounds, cards |
| **Accent** | Electric blue | Interactive elements, links, primary actions |
| **Error** | Pink/red | Destructive states |
| **Success** | Teal/green | Positive states |
| **Warning** | Yellow | Caution states |
| **Expressive** | Custom palette | Rich color experiences |

### In Comps

```css
:root {
    --slds-g-color-surface-1: #ffffff;
    --slds-g-color-surface-2: #f3f3f3;
    --slds-g-color-accent-1: #0176d3;
    --slds-g-color-on-surface-1: #747474;
    --slds-g-color-on-surface-2: #444444;
    --slds-g-color-on-surface-3: #181818;
    --slds-g-color-error-1: #ba0517;
    --slds-g-color-success-1: #2e844a;
    --slds-g-color-warning-1: #fe9339;
    --slds-g-color-border-1: #c9c9c9;
}
```

---

## Typography

### Font Stack

System fonts — no custom typeface required:
- Apple: SF Pro
- Windows: Segoe UI
- Android: Roboto
- Fallback: Helvetica, Arial, sans-serif

### Font Scale Tokens

| Token | Usage |
|-------|-------|
| `--slds-g-font-scale-2` | Smallest text |
| `--slds-g-font-scale-3` | Small labels, metadata |
| `--slds-g-font-scale-4` | Body text |
| `--slds-g-font-scale-5` | Subtitle |
| `--slds-g-font-scale-6` | Section heading |
| `--slds-g-font-scale-7` | Page heading |
| `--slds-g-font-scale-8` | Display heading |

### Font Weight Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--slds-g-font-weight-3` | 300 (Light) | Display text |
| `--slds-g-font-weight-4` | 400 (Regular) | Titles and body |
| `--slds-g-font-weight-6` | 600 (Semibold) | Buttons, smaller titles |
| `--slds-g-font-weight-7` | 700 (Bold) | Emphasis (use sparingly) |

### Text Color Hooks

| Token | Usage |
|-------|-------|
| `--slds-g-color-on-surface-1` | Lightest text (placeholder, disabled) |
| `--slds-g-color-on-surface-2` | Secondary text |
| `--slds-g-color-on-surface-3` | Primary text (titles, labels) |
| `--slds-g-color-on-surface-inverse` | Text on dark backgrounds |
| `--slds-g-color-accent-1` | Link text (electric blue) |

---

## Spacing

### Styling Hooks

| Hook | Purpose |
|------|---------|
| `--slds-g-spacing-*` | Controls margins, padding, gaps |
| `--slds-g-sizing-*` | Controls component heights, widths (small/medium/large variants) |

### Display Density

SLDS 2 treats density as a **first-class foundation**:

| Density | Description |
|---------|-------------|
| **Comfortable** | Default — generous spacing for focus and clarity |
| **Compact** | Reduced spacing for data-dense views (tables, lists, dashboards) |

---

## Layout

### Layout Patterns

| Pattern | Structure |
|---------|-----------|
| **Record** | Detail view for a single record (contact, opportunity) |
| **Workspace** | Multi-panel working environment |
| **Reference** | Lookup/reference layout |
| **List** | Table, Board, or Master-Detail list views |

### Responsive Design

SLDS provides responsive utilities but specific breakpoint tokens are managed through Lightning component APIs rather than public CSS tokens.

---

## Elevation

### Shadows

`--slds-g-shadow-*` styling hooks for depth. Soft shadows convey surfaces moving on top of one another.

### Philosophy

Elevation is used to show interactivity and hierarchy — modals and popovers float above content; cards rest slightly above the page.

### In Comps

```css
.card    { box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
.popover { box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); }
.modal   { box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2); }
```

---

## Shapes

### Border Hooks

| Hook | Purpose |
|------|---------|
| `--slds-g-color-border-*` | Border color |
| `--slds-g-border-width-*` | Border width |
| `--slds-g-border-radius-*` | Border radius |

### Radius Guidelines

- **Smaller radius** for dense components (buttons, inputs)
- **Larger radius** for spacious components (cards, modals)
- **Don't mix** sharp and rounded corners within the same component

---

## Iconography

### SLDS Icons

SVG icon library organized by category:

| Category | Usage |
|----------|-------|
| **Standard** | Object-specific icons (Account, Contact, Opportunity) |
| **Utility** | UI actions and navigation |
| **Custom** | Custom object icons |
| **Doctype** | File type icons |
| **Action** | Quick actions |

### Icon Rules

- Use the appropriate category for context
- Match icon color to surrounding text token
- Standard icons include colored circular backgrounds; utility icons are single-color

---

## Interaction States

States are built into components and managed via semantic styling hooks:

| State | Treatment |
|-------|-----------|
| **Hover** | Background/border shift via themed hooks |
| **Focus** | Blue focus ring |
| **Active** | Deeper color shift |
| **Disabled** | Muted gray, non-interactive |

---

## Design Tokens

### Styling Hooks Architecture

SLDS 2's core innovation: **CSS custom properties** ("styling hooks") that decouple structure from visual style.

| Property | Description |
|----------|-------------|
| **Prefix** | `--slds-g-*` |
| **Mutable** | Theme-dependent — change with theme/brand |
| **Constant** | Palette values — never change |

### Naming Convention

```
--slds-g-{category}-{property}-{variant}
```

Examples:
- `--slds-g-color-surface-1`
- `--slds-g-font-weight-6`
- `--slds-g-spacing-4`
- `--slds-g-border-radius-2`
- `--slds-g-shadow-1`

### Key Difference from SLDS 1

SLDS 1 used Sass design tokens compiled at build time. SLDS 2 uses **runtime CSS custom properties** that can be overridden without rebuilding — enabling no-code theming.

---

## Applying SLDS in Comps

When building comps with SLDS 2 principles, follow this checklist:

### Must-Have

- [ ] Use system font stack — no custom font loading
- [ ] Use `--slds-g-color-*` semantic hooks — never raw hex values
- [ ] Use `on-*` color tokens for text on colored backgrounds
- [ ] Use `--slds-g-spacing-*` hooks for all margins, padding, gaps
- [ ] Implement hover/focus/active/disabled states on all interactive elements
- [ ] Blue focus ring on keyboard-focused elements
- [ ] Support `prefers-reduced-motion`

### Should-Have

- [ ] Display density support (comfortable and compact modes)
- [ ] Salesforce layout patterns (record, workspace, list)
- [ ] `--slds-g-shadow-*` hooks for elevation on cards, popovers, modals
- [ ] `--slds-g-border-radius-*` hooks — smaller for dense, larger for spacious
- [ ] Font scale and weight hooks for consistent typography

### Nice-to-Have

- [ ] AI-ready component patterns ("Agentic Experiences")
- [ ] No-code theming — all visual values overridable via CSS custom property assignment
- [ ] Standard and Utility icon categories for object and action representation
- [ ] Expressive palette for rich color experiences beyond the base UI
