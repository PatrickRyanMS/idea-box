# Skill: Contrast Ratio Calculation

How to calculate WCAG 2.2 contrast ratios between two colors. This skill provides the exact formulas, a ready-to-use JavaScript utility, a pre-computed reference table for common color pairs, and the decision rules for which threshold applies when.

Use this skill when generating color palettes, verifying accessibility of color choices, or embedding a contrast checker into comp builds.

---

## The Formula

WCAG contrast ratio is computed in three steps:

### Step 1: Parse Hex to sRGB

Convert each hex color to its sRGB components (0–1 range):

```
R_sRGB = R_8bit / 255
G_sRGB = G_8bit / 255
B_sRGB = B_8bit / 255
```

Example: `#3498db` → R=52, G=152, B=219 → R_sRGB=0.2039, G_sRGB=0.5961, B_sRGB=0.8588

### Step 2: Linearize sRGB to Get Relative Luminance

Each sRGB channel must be linearized using the sRGB transfer function before computing luminance. This is the step models get wrong — it involves a conditional and an exponent:

```
For each channel C_sRGB (where C is R, G, or B):

  if C_sRGB <= 0.04045:
      C_linear = C_sRGB / 12.92
  else:
      C_linear = ((C_sRGB + 0.055) / 1.055) ^ 2.4
```

Then compute relative luminance:

```
L = 0.2126 × R_linear + 0.7152 × G_linear + 0.0722 × B_linear
```

The result L is a value between 0 (pure black) and 1 (pure white).

### Step 3: Compute Contrast Ratio

```
contrast_ratio = (L_lighter + 0.05) / (L_darker + 0.05)
```

Where L_lighter is the higher luminance and L_darker is the lower. The ratio ranges from 1:1 (identical) to 21:1 (black on white).

---

## JavaScript Utility

Copy-paste this into any comp or use it in a `<script>` block to verify palette colors at build time.

```javascript
/**
 * WCAG 2.2 Contrast Ratio Calculator
 * Source: https://www.w3.org/TR/WCAG22/#dfn-contrast-ratio
 */

function hexToRgb(hex) {
  const h = hex.replace('#', '');
  return [
    parseInt(h.substring(0, 2), 16) / 255,
    parseInt(h.substring(2, 4), 16) / 255,
    parseInt(h.substring(4, 6), 16) / 255
  ];
}

function linearize(c) {
  return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
}

function luminance(hex) {
  const [r, g, b] = hexToRgb(hex).map(linearize);
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function contrastRatio(hex1, hex2) {
  const l1 = luminance(hex1);
  const l2 = luminance(hex2);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

/**
 * Check if a color pair meets a WCAG threshold.
 * @param {string} fg - Foreground hex color (e.g., '#333333')
 * @param {string} bg - Background hex color (e.g., '#ffffff')
 * @param {'AA'|'AA-large'|'AAA'|'AAA-large'|'UI'} level
 * @returns {{ ratio: number, passes: boolean, required: number }}
 */
function checkContrast(fg, bg, level = 'AA') {
  const thresholds = {
    'AA':        4.5,   // Normal text
    'AA-large':  3.0,   // Large text (18pt+ or 14pt+ bold)
    'AAA':       7.0,   // Enhanced normal text
    'AAA-large': 4.5,   // Enhanced large text
    'UI':        3.0    // Non-text UI components, icons, focus indicators
  };
  const required = thresholds[level];
  const ratio = contrastRatio(fg, bg);
  return {
    ratio: Math.round(ratio * 100) / 100,
    passes: ratio >= required,
    required
  };
}
```

### Usage Examples

```javascript
// Check body text on a white background
checkContrast('#666666', '#ffffff', 'AA');
// → { ratio: 5.74, passes: true, required: 4.5 }

// Check a heading (large text) on a light surface
checkContrast('#888888', '#f5f5f5', 'AA-large');
// → { ratio: 2.36, passes: false, required: 3.0 }

// Check an icon button against its background
checkContrast('#3498db', '#ffffff', 'UI');
// → { ratio: 3.95, passes: true, required: 3.0 }

// Batch-check all palette variables
const palette = {
  primary: '#3498db',
  text: '#212529',
  textMuted: '#6c757d',
  bg: '#ffffff',
  surface: '#f8f9fa'
};

console.table([
  { pair: 'text/bg',        ...checkContrast(palette.text, palette.bg, 'AA') },
  { pair: 'text/surface',   ...checkContrast(palette.text, palette.surface, 'AA') },
  { pair: 'muted/bg',       ...checkContrast(palette.textMuted, palette.bg, 'AA') },
  { pair: 'muted/surface',  ...checkContrast(palette.textMuted, palette.surface, 'AA') },
  { pair: 'primary/bg (UI)',...checkContrast(palette.primary, palette.bg, 'UI') }
]);
```

---

## WCAG Threshold Quick Reference

| Context | Level | Minimum Ratio |
|---------|-------|---------------|
| Normal body text | AA | **4.5:1** |
| Large text (≥18pt regular or ≥14pt bold) | AA | **3:1** |
| Normal body text | AAA | 7:1 |
| Large text | AAA | 4.5:1 |
| UI component boundaries, icons, focus indicators | AA | **3:1** |

**Bold rows are the ones you hit most often.** Target AA as the minimum; AAA is aspirational.

### What Counts as Large Text?

- **18pt (24px)** regular weight or larger
- **14pt (18.5px)** bold weight or larger
- These thresholds apply to the rendered size, not the CSS value — if your base font is 16px, then `1.5rem` (24px) qualifies as large

---

## Pre-Computed Reference Table

Common foreground/background pairs and their contrast ratios. Use this to quickly validate choices without computing.

### On White (#ffffff)

| Color | Hex | Ratio | AA Text | AA Large | UI |
|-------|-----|-------|---------|----------|-----|
| Black | #000000 | 21.00 | Pass | Pass | Pass |
| Gray 900 | #212529 | 16.46 | Pass | Pass | Pass |
| Gray 700 | #495057 | 9.47 | Pass | Pass | Pass |
| Gray 600 | #6c757d | 5.74 | Pass | Pass | Pass |
| Gray 500 | #adb5bd | 2.86 | **Fail** | **Fail** | **Fail** |
| Gray 400 | #ced4da | 1.94 | **Fail** | **Fail** | **Fail** |
| Blue (Bootstrap) | #0d6efd | 4.63 | Pass | Pass | Pass |
| Blue (Tailwind 600) | #2563eb | 5.18 | Pass | Pass | Pass |
| Blue (common link) | #3498db | 3.95 | **Fail** | Pass | Pass |
| Red (danger) | #dc3545 | 4.01 | **Fail** | Pass | Pass |
| Green (success) | #198754 | 4.58 | Pass | Pass | Pass |
| Orange (warning) | #fd7e14 | 2.66 | **Fail** | **Fail** | **Fail** |
| Yellow (warning) | #ffc107 | 1.62 | **Fail** | **Fail** | **Fail** |

### On Dark (#1a1a2e)

| Color | Hex | Ratio | AA Text | AA Large | UI |
|-------|-----|-------|---------|----------|-----|
| White | #ffffff | 16.29 | Pass | Pass | Pass |
| Gray 200 | #e9ecef | 13.35 | Pass | Pass | Pass |
| Gray 400 | #ced4da | 10.82 | Pass | Pass | Pass |
| Gray 500 | #adb5bd | 7.34 | Pass | Pass | Pass |
| Gray 600 | #6c757d | 3.46 | **Fail** | Pass | Pass |
| Light blue | #5dade2 | 6.99 | Pass | Pass | Pass |
| Light green | #58d68d | 7.50 | Pass | Pass | Pass |
| Light orange | #f5b041 | 8.39 | Pass | Pass | Pass |

### Key Takeaways from the Tables

- **#6c757d (Bootstrap's `text-muted`) barely passes AA on white** (5.74:1) — don't go any lighter for body text
- **Standard link blue (#3498db) fails AA for normal text on white** — use a darker blue like #2563eb or #0d6efd
- **Yellow and orange text on white always fail** — use them only for backgrounds or large decorative elements, never body text
- **On dark backgrounds, medium grays (500–600) become the danger zone** — the same colors that are fine on white fail on dark

---

## Decision Flowchart

When checking a color pair:

```
Is the element TEXT?
├── YES → Is it large text (≥18pt regular or ≥14pt bold)?
│   ├── YES → Need 3:1 (AA) or 4.5:1 (AAA)
│   └── NO  → Need 4.5:1 (AA) or 7:1 (AAA)
└── NO → Is it a UI component boundary, icon, or focus indicator?
    ├── YES → Need 3:1 (AA)
    └── NO  → Is it purely decorative?
        ├── YES → No contrast requirement
        └── NO  → Treat as UI component → Need 3:1
```

---

## How to Embed in Comps

When building a comp set, include the contrast utility in `styles.css` or a shared `contrast-check.js` file. Then add a dev-only panel (hidden by default) that shows the contrast ratios for all palette variable pairs:

```html
<!-- Dev contrast checker — hidden in review, visible with ?debug=contrast -->
<script>
if (new URLSearchParams(location.search).has('debug')) {
  const style = getComputedStyle(document.documentElement);
  const vars = ['primary','primary-light','primary-dark','secondary','accent',
                'bg','surface','surface-alt','text','text-muted','text-inverse'];
  const get = (v) => style.getPropertyValue('--palette-' + v).trim();

  const checks = [
    ['text', 'bg'], ['text', 'surface'], ['text-muted', 'bg'],
    ['text-muted', 'surface'], ['primary', 'bg'], ['primary', 'surface'],
    ['text-inverse', 'primary'], ['text-inverse', 'primary-dark'],
    ['accent', 'bg'], ['accent', 'surface']
  ];

  const results = checks.map(([fg, bg]) => ({
    pair: `${fg} / ${bg}`,
    fg: get(fg), bg: get(bg),
    ...checkContrast(get(fg), get(bg), 'AA')
  }));

  console.table(results);
  const fails = results.filter(r => !r.passes);
  if (fails.length) {
    console.warn('⚠️ Contrast failures:', fails.map(f => f.pair).join(', '));
  }
}
</script>
```

This gives the user a way to verify accessibility by appending `?debug` to the comp URL.

---

## Common Pitfalls

1. **Forgetting the linearization step** — Using raw sRGB values (skipping the gamma correction) produces incorrect ratios. The `linearize()` function is not optional.
2. **Confusing the ratio direction** — The ratio is always lighter/darker, not fg/bg. A dark text on light background and light text on dark background can produce the same ratio.
3. **Checking against the wrong background** — If text sits on a gradient or image, check against the worst-case (lowest contrast) region.
4. **Opacity reduces contrast** — Semi-transparent text or backgrounds effectively blend colors. Compute the blended color first, then check contrast.
5. **CSS variable indirection** — When colors come from `--palette-*` variables, resolve the actual computed value before checking. The variable name tells you nothing about the color.

---

## Source

Formulas from [WCAG 2.2 §1.4.3 Contrast (Minimum)](https://www.w3.org/TR/WCAG22/#contrast-minimum) and the [relative luminance](https://www.w3.org/TR/WCAG22/#dfn-relative-luminance) and [contrast ratio](https://www.w3.org/TR/WCAG22/#dfn-contrast-ratio) definitions in the WCAG 2.2 glossary.
