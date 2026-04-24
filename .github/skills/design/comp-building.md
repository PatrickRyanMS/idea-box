# Comp Building

Procedural knowledge for creating, managing, and iterating on design comps. Both Klee and Axiom reference this skill when working with the comp system.

Comps are quick, isolated UI design explorations rendered as plain HTML/CSS/JS. They are NOT production code. They exist so the user can see options, react, iterate, and sign off on a direction.

---

## Request Types

### 1. New Exploration

Create a fresh comp set with 3-5 design variations.

- Create the comp set folder in `active/{feature-name}/`
- Generate `index.html` from the viewer template, individual comp files, `styles.css`, `comp-set.md`
- Suggest 2-3 color palettes (read the Color Theory skill first) and generate palette CSS files in `palettes/`
- Add the exploration and palettes to `manifest.json`
- Ensure the landing page (`index.html` at comps root) exists

#### Completeness Checklist — New Exploration

**Before signaling completion of any new exploration, verify every item below exists.** If any item is missing, create it before signaling. This is not optional — an incomplete exploration blocks the pipeline.

- [ ] `active/{feature-name}/design-spec.md` — design spec reviewed and approved by user
- [ ] `active/{feature-name}/` folder exists
- [ ] `active/{feature-name}/index.html` — viewer page generated from comp-viewer-template.html with `{{EXPLORATION_ID}}` set
- [ ] `active/{feature-name}/comp-a.html`, `comp-b.html`, `comp-c.html` (etc.) — individual comp files (3-5)
- [ ] `active/{feature-name}/styles.css` — shared styles with `--palette-*` variables in `:root`
- [ ] `active/{feature-name}/comp-set.md` — metadata file with all fields filled in
- [ ] `palettes/` — 2-3 palette CSS files created (or existing palettes referenced)
- [ ] `manifest.json` — exploration entry added with `name`, `screenName`, `navSelectors`, `status`, `created`, `path`, `palettes`, and `comps` array
- [ ] `manifest.json` — palette entries added for any new palettes
- [ ] `manifest.json` — `navButtons` updated if new navigation selectors were introduced
- [ ] `.github/comps/index.html` — landing page exists (create from template if first exploration)

**Every exploration must produce ALL of these artifacts.** There is no such thing as a "partial exploration." If you run out of context or encounter an error, signal the problem — do not produce half the files and leave the rest incomplete.

#### Migration / Translation Variant

If there are **existing comp files** that need to be translated into the current comp system structure:

1. **Read the existing comp files** — do not skip reading them in favor of relaying design details
2. Preserve the designs as-is (layout, styling, icons, content) unless changes are specified
3. Rebuild each comp using the current templates, palette system, and manifest structure
4. Generate palettes that match the colors already in use in the existing comps
5. This is still a "New Exploration" — it produces the same output (comp set, viewer, manifest entry, palettes), just sourced from existing files rather than an exploration report

### 2. Edit Comp

Modify a specific comp within an existing exploration without generating new files.

- Edit the specified comp file in place
- Update comp-set.md iteration log
- Do **not** create new comp files or regenerate the set

### 3. Expand Comp

Take one comp from an exploration and generate 3-5 variations of it as a new nested exploration.

- Create a new folder: `active/{parent}.{comp-id}/` (e.g., `active/hero-section.comp-b/`)
- The expansion references its parent exploration and source comp in `comp-set.md` and `manifest.json`
- Comps inside use standard labeling (Comp A, Comp B, Comp C) — not compound names
- Palettes from the parent exploration carry forward; additional palettes can be added
- Set `depth` field in manifest. **Maximum depth is 2.** If already at depth 2, reject and report that the user should iterate on existing comps instead.

#### Completeness Checklist — Expansion

Same as New Exploration, but also verify:
- [ ] `parent` and `sourceComp` fields set in manifest entry
- [ ] `depth` field set correctly (parent depth + 1)
- [ ] `screenName` and `navSelectors` inherited from parent exploration

### 4. Build / Update Flow

Assemble or update the **single project flow** from `buttonMappings`.

- The landing page "Make Flow" / "Update Flow" button triggers this
- Or the user requests a flow build directly
- Create (or update) the flow folder in `flows/project-flow/`
- Generate `index.html` from the flow template with `{{FLOW_ID}}` set to `project-flow`
- Build the `flow` object from `buttonMappings` (group by exploration+comp, auto-wire interactions) and write it to `manifest.json`
- Each screen in the flow corresponds to one comp from `buttonMappings`, identified by its exploration's `screenName` and wired via the mapped selectors

---

## First-Time Setup

On the **first exploration** in a project, create the comps directory structure:

1. Create `.github/comps/` with subdirectories: `active/`, `approved/`, `palettes/`, `flows/`
2. Copy `.github/schemas/comp-landing-template.html` → `.github/comps/index.html`
3. Create `.github/comps/manifest.json` from the manifest template (empty `explorations`, `palettes`, `navButtons`, and `flow` objects)

After first-time setup, these files persist and are updated incrementally.

---

## Directory Structure

```
.github/comps/
├── index.html                    # Landing page (tree navigator — from template)
├── manifest.json                 # Source of truth for all explorations, palettes, flows
├── palettes/                     # Shared palette CSS files
│   ├── warm-tones.css
│   └── cool-breeze.css
├── active/
│   ├── hero-section/             # Root exploration (depth 0)
│   │   ├── index.html            # Viewer with palette switcher
│   │   ├── comp-a.html
│   │   ├── comp-b.html
│   │   ├── comp-c.html
│   │   ├── styles.css
│   │   └── comp-set.md
│   └── hero-section.comp-b/     # Expansion of comp-b (depth 1)
│       ├── index.html
│       ├── comp-a.html
│       ├── comp-b.html
│       ├── comp-c.html
│       ├── styles.css
│       └── comp-set.md
├── flows/
│   └── onboarding/
│       └── index.html            # Click-through viewer
└── approved/
    └── hero-section/
        └── ...
```

**Comps are persistent.** Never delete or clean up comp folders. They stay in the project until the user explicitly removes them.

---

## Manifest Management

`manifest.json` at the comps root is the **source of truth**. The landing page, flow viewers, and comp viewers all read from it. Update it after every creation, edit, or status change.

### Structure

```json
{
  "navButtons": [
    { "selector": ".nav-home", "label": "Home" },
    { "selector": ".nav-settings", "label": "Settings" },
    { "selector": ".nav-profile", "label": "Profile" }
  ],
  "explorations": {
    "home-screen": {
      "name": "Home Screen",
      "screenName": "Home",
      "navSelectors": [".nav-home"],
      "status": "active",
      "created": "2026-03-18",
      "path": "active/home-screen",
      "palettes": ["warm-tones", "cool-breeze"],
      "comps": [
        { "id": "comp-a", "label": "Minimal Hero (A)", "description": "Clean layout with single CTA", "file": "comp-a.html" },
        { "id": "comp-b", "label": "Bold Split Layout (B)", "description": "Two-column hero with large image", "file": "comp-b.html" },
        { "id": "comp-c", "label": "Card Grid Overview (C)", "description": "Dashboard-style card grid", "file": "comp-c.html" }
      ]
    },
    "home-screen.comp-b": {
      "name": "Home Screen — Bold Split Layout (B) Variations",
      "screenName": "Home",
      "navSelectors": [".nav-home"],
      "status": "active",
      "created": "2026-03-18",
      "parent": "home-screen",
      "sourceComp": "comp-b",
      "depth": 1,
      "path": "active/home-screen.comp-b",
      "palettes": ["warm-tones"],
      "comps": [
        { "id": "comp-a", "label": "Dark Overlay (A)", "description": "Dark overlay variant of split layout", "file": "comp-a.html" },
        { "id": "comp-b", "label": "Light Reverse (B)", "description": "Reversed columns, light theme", "file": "comp-b.html" }
      ]
    }
  },
  "palettes": {
    "warm-tones": { "name": "Warm Tones", "file": "palettes/warm-tones.css" },
    "cool-breeze": { "name": "Cool Breeze", "file": "palettes/cool-breeze.css" }
  },
  "buttonMappings": {
    ".nav-home": {
      "exploration": "home-screen",
      "comp": "comp-a",
      "source": "active/home-screen/comp-a.html"
    }
  },
  "flow": null
}
```

**Key manifest fields:**

- **`navButtons`** (top-level array) — All known navigation buttons in the app. Each entry has a `selector` (CSS selector matching the button in a nav comp) and a `label` (human-readable). This list grows as new navigation points are discovered — from user specifications, exploration reports, or inspecting nav comps.
- **`buttonMappings`** (top-level object) — Maps each nav selector to exactly one comp. Keyed by CSS selector (e.g., `".nav-home"`). Each value has `exploration` (ID), `comp` (ID), and `source` (relative path to the comp HTML file). **One comp per button.** When a user maps a different comp to the same button, the old mapping is replaced. The landing page UI enforces this. The flow viewer builds its screen list from these mappings.
- **`screenName`** (per exploration) — The app screen this exploration represents (e.g., "Home", "Settings"). All comps in the exploration are variations of the same screen.
- **`navSelectors`** (per exploration) — Array of CSS selectors from `navButtons` that route to this screen. Can be empty (unassigned). **One button can only point to one screen** — if a selector is assigned here, it must not appear in any other exploration's `navSelectors`. Multiple selectors per screen is fine (e.g., sidebar and toolbar both go to Settings).
- **`flow`** (top-level, singular) — One flow per project. Set to `null` when no flow exists. Built from `buttonMappings`. See Flow section below.

### Update Rules

- **New exploration**: Add entry to `explorations` with status `"active"`, `screenName`, and `navSelectors` (can be `[]` if unassigned). If the exploration report includes a "Button Mappings" table, add any new selectors to `navButtons` and set initial `buttonMappings` entries (mapping each selector to `comp-a` by default).
- **New nav button**: Append to top-level `navButtons` array if the selector doesn't already exist
- **Assign nav selector**: Add selector to exploration's `navSelectors`. If that selector was in another exploration's `navSelectors`, remove it from the old one (enforce one-button-one-screen)
- **Unassign nav selector**: Remove from exploration's `navSelectors`. Also remove any `buttonMappings` entry for that selector.
- **Map button to comp**: Set `buttonMappings[selector] = { exploration, comp, source }`. Only one comp per selector — replaces previous mapping.
- **Unmap button**: Delete `buttonMappings[selector]`
- **New palette**: Add to global `palettes` and add the palette ID to the exploration's `palettes` array
- **Kill comp**: Remove from exploration's `comps` array. Also remove any `buttonMappings` entries pointing to this comp.
- **Add comp**: Append to exploration's `comps` array
- **Expand comp**: Add new exploration entry with `parent`, `sourceComp`, `depth` fields. Inherit `screenName` and `navSelectors` from parent.
- **Approve**: Change `status` to `"approved"`, update `path` to `approved/{name}`. Update `source` in any `buttonMappings` entries that reference this exploration.
- **Build/update flow**: Build the `flow` object from `buttonMappings` (see Flow section)

---

## Expansion Rules

Expansions create focused variation sets from a single comp.

### Naming

The folder name is `{parent-id}.{comp-id}`:
- `hero-section.comp-b` — expansion of comp-b from hero-section
- `hero-section.comp-b.comp-a` — expansion of comp-a from the above expansion (depth 2)

### Depth Limit

| Depth | Example | Allowed |
|-------|---------|---------|
| 0 | `hero-section` | Always (root exploration) |
| 1 | `hero-section.comp-b` | Yes |
| 2 | `hero-section.comp-b.comp-a` | Yes (maximum) |
| 3+ | `hero-section.comp-b.comp-a.comp-c` | **No** — reject and advise iteration |

When a depth-2 exploration is requested, report: "This exploration is at maximum depth. The user should iterate on existing comps instead of creating another layer."

### Files Inside Expansions

Comps inside an expansion use **descriptive naming with letter suffixes** — e.g., "Dark Overlay (A)", "Light Reverse (B)". The folder name carries the lineage — the comp names themselves start fresh. Expansions inherit the parent's `screenName` and `navSelectors`.

---

## Palette System

### Purpose

Palettes let the user see the same comps rendered in different color schemes without regenerating HTML. The comp viewer has a palette switcher bar; clicking a palette updates CSS custom properties across all comps on the page.

### How It Works

1. Comp styles reference `--palette-*` CSS variables for all color values
2. Default colors are defined in `:root` of the comp's `styles.css`
3. Named palettes are CSS files in `palettes/` that override variables via `[data-palette="name"]` selector
4. The viewer template loads palette files dynamically and toggles `data-palette` on the body

### Palette Variables

All comp styles should use these variables. Do not hardcode colors.

```css
/* In styles.css — :root defines the default palette */
:root {
    --palette-primary: #3498db;
    --palette-primary-light: #5dade2;
    --palette-primary-dark: #2980b9;
    --palette-secondary: #2ecc71;
    --palette-secondary-light: #58d68d;
    --palette-secondary-dark: #27ae60;
    --palette-accent: #f39c12;
    --palette-accent-light: #f5b041;
    --palette-accent-dark: #d68910;
    --palette-bg: #ffffff;
    --palette-surface: #f8f9fa;
    --palette-surface-alt: #e9ecef;
    --palette-text: #212529;
    --palette-text-muted: #6c757d;
    --palette-text-inverse: #ffffff;
    --palette-border: #dee2e6;
    --palette-border-light: #f1f3f5;
}
```

### Color Palette Direction from the User

The base color for a palette **must come from the user**, not from the agent. Before generating palettes, determine the user's color direction from the prompt:

1. **Explicit color** — The user names a color (e.g., "deep teal", "#FF6B35"). Use it as the primary.
2. **Abstract mood** — The user gives a color mood (e.g., "warm fall colors", "exciting bright colors", "calm ocean vibes"). Interpret the mood into a primary color using the Color Theory skill, then build the palette from that.
3. **Attached image** — The user attaches an image for inspiration. Identify the dominant and accent colors in the image and derive palette primaries from what you observe. Note the source colors in comp-set.md.
4. **No color direction at all** — If the prompt contains **no mention of color**, not even an abstract mood, **ask the user** for a color direction before generating palettes.

Once you have the user's color direction, use the Color Theory skill to expand it into a full palette using appropriate harmonies (complementary, analogous, triadic, etc.).

### Generating Palettes

When creating a new exploration:

1. **Resolve the user's color direction** (see above) — do not proceed without it
2. Read the **Color Theory skill** (`.github/skills/design/color-theory.md`)
3. Build palettes from the user's base color using different harmony strategies
4. Suggest 2-3 named palettes (e.g., "Warm Sunset", "Ocean Calm", "High Contrast")
5. Generate a CSS file per palette in `palettes/` using the palette template from `.github/schemas/comp-palette-template.css`
6. Register each palette in `manifest.json` under `palettes`
7. Add palette IDs to the exploration's `palettes` array

Palette names should be kebab-case IDs (e.g., `warm-sunset`). The `name` field in the manifest is the human-readable label.

### Palette Edits

When the user asks to revise palettes (without regenerating comps):
- Edit the palette CSS file directly
- Or create a new palette file and add it to the manifest
- This is an **Edit Comp** level operation — no new exploration needed

---

## Templates

### Viewer Template

Use `.github/schemas/comp-viewer-template.html` as the base for each exploration's `index.html`. The viewer provides:

- Banner with **"COMP REVIEW — [Component Name]"** and status
- **Palette switcher bar** — loaded dynamically from `manifest.json`
- Context section: component description, design requirements, experience location
- Comp grid with labeled cards
- Footer with design exploration disclaimer

When generating `index.html`, embed `{{EXPLORATION_ID}}` in the script block. The viewer uses this to fetch its palette info from `manifest.json`.

### Comp Naming in Viewer

Comp cards in the viewer use **descriptive labels with letter suffixes**: "Minimal Hero (A)", "Bold Split Layout (B)", etc. The `label` field in the manifest is this full descriptive name. The `id` field stays as `comp-a`, `comp-b`, etc. for internal reference and file naming.

### Landing Page

`.github/schemas/comp-landing-template.html` is copied to `.github/comps/index.html` on first-time setup. It is a self-updating page that reads `manifest.json` on load and renders:

- Tree view of all explorations (with nested expansions inline)
- **Screen name prefix** on each exploration row (e.g., "Home — Minimal Hero (A)")
- **Nav link dropdown** (multi-select checkboxes) per exploration showing all known `navButtons`. Assigning a button here updates the exploration's `navSelectors` in the manifest. If a button was assigned to another exploration, it is automatically unassigned from the old one (one-button-one-screen rule).
- Each comp row shows its descriptive label with letter suffix and a **mapping dropdown** listing the exploration's nav buttons. Selecting a button assigns this comp as the one loaded when that button is clicked. Only one comp per button — selecting a second comp for the same button replaces the previous mapping.
- **"Make Flow" / "Update Flow" button** at the bottom — builds the flow from `buttonMappings` (groups by exploration+comp, auto-wires interactions). After a flow exists, the button label changes to "Update Flow".
- Mapping panel showing current button→comp assignments

**You do not edit the landing page directly.** Changes to `manifest.json` are reflected automatically.

#### Button Mapping UI

Each comp row in the landing page has a **mapping dropdown** (instead of the old flow checkboxes). The dropdown lists the nav buttons assigned to this exploration. Selecting a button maps that button to this comp in `buttonMappings`. Only one comp per button — selecting a second comp for the same button replaces the previous mapping.

The bottom panel shows all current button→comp mappings (e.g., "Home → Minimal Hero (A)"). The "Make Flow" button builds the flow from these mappings.

### Flow Viewer

`.github/schemas/comp-flow-template.html` is copied to `flows/project-flow/index.html` with `{{FLOW_ID}}` set to `project-flow` and `{{FLOW_NAME}}` set to the project name. It provides:

- **Route bar** with direct-click buttons — one per mapped route
- Iframe-based comp loading — shows the single comp assigned to the active route
- **Interaction injection** — after iframe loads, the viewer finds elements matching nav selectors from other routes and adds click handlers that navigate to the target route's comp
- Palette switcher that applies palettes inside the iframe
- Keyboard navigation (arrow keys)

---

## Flow Building

There is **one flow per project**. It lives at `flows/project-flow/` and maps to `manifest.json` → `flow`. The flow is **built from `buttonMappings`**, not from manually selected comps.

### How Button Mappings Drive the Flow

`buttonMappings` is the source of truth for which comp appears when a nav button is clicked. The flow is derived from it:

1. Group `buttonMappings` entries by `exploration + comp` to deduplicate (multiple selectors may point to the same screen)
2. Each unique group becomes one flow screen
3. The screen's `navSelectors` are all the selectors that map to it
4. Interactions are auto-wired from other screens' `navSelectors`

### Flow Structure in Manifest

When a flow exists, `manifest.json` → `flow` contains:

```json
{
  "flow": {
    "name": "Project Flow",
    "created": "2026-03-19",
    "screens": [
      {
        "id": "home",
        "screenName": "Home",
        "label": "Minimal Hero (A)",
        "source": "active/home-screen/comp-a.html",
        "navSelectors": [".nav-home"],
        "interactions": [
          { "selector": ".nav-settings", "target": "settings" }
        ]
      },
      {
        "id": "settings",
        "screenName": "Settings",
        "label": "Compact Panel (B)",
        "source": "active/settings-page/comp-b.html",
        "navSelectors": [".nav-settings", ".toolbar-settings"],
        "interactions": []
      }
    ]
  }
}
```

Each screen's `id` is derived from its `screenName` (kebab-cased). The `navSelectors` come from `buttonMappings`. Interactions are auto-wired: for each `navSelector` on any *other* screen, create an interaction mapping `{ selector, target }` so clicking that button navigates to the corresponding screen.

### Auto-Wiring Interactions

When building the flow, interactions are derived from `navSelectors` automatically:

1. For each screen in the flow, collect all `navSelectors` from every *other* screen
2. Each of those selectors becomes an interaction: `{ "selector": ".nav-X", "target": "screen-id" }`
3. This means: if a comp contains a `.nav-settings` button and there's a Settings screen in the flow, clicking that button navigates to Settings
4. Missing screens are fine — if a nav button has no matching screen, no interaction is added for it

### Limitations

Flows are same-origin only (served via the comp viewer server). The interaction injection accesses the iframe DOM directly, which requires same-origin.

---

## Styling Rules

- **Page background**: Every individual comp file must set `body { background: #e8e8e8; }` to match the comp viewer shell. This ensures a consistent review experience whether viewing a single comp or the full grid.
- **Icons**: Use **Fluent System Icons** for all icons in comps. Read the Fluent Icons skill (`.github/skills/design/fluent-icons.md`) for sourcing methods. Do not use emoji, FontAwesome, Material Icons, or hand-drawn SVG paths when a Fluent icon exists for the concept. Only skip Fluent icons if the user explicitly requests a different icon source.
- Use `--palette-*` CSS custom properties for **all color values** — no hardcoded colors
- Define default palette values in `:root` of `styles.css`
- Follow the project's design system (`.github/style/design-system.md`) for typography, spacing when available
- If no design system exists yet, use sensible defaults and note them in comp-set.md
- Keep styles scoped — each comp should be self-contained
- **Vanilla HTML/CSS/JS only** — no frameworks (React, Vue, etc.)

---

## Accessibility Requirements

**Read the Accessibility skill (`.github/skills/design/accessibility.md`) before building any comp.** Accessibility is a design-time constraint, not a post-build audit. Every comp must meet WCAG 2.2 AA from the start. Comps that fail accessibility checks require rework, which wastes cycles.

At minimum, every comp must satisfy:

- **Text contrast** — 4.5:1 for body text, 3:1 for large text (18pt+ regular or 14pt+ bold)
- **Non-text contrast** — 3:1 for UI component boundaries (buttons, inputs, icons)
- **Contrast verification** — Read the Contrast Ratio Calculation skill (`.github/skills/design/contrast-ratio.md`) and use its JS utility to verify all palette text/background pairs. Embed the debug contrast checker in each comp's `<script>` block so ratios are verifiable at `?debug`. Do not eyeball contrast — compute it.
- **No color-only information** — Error states, required fields, status indicators, and links use more than just color
- **Visible focus indicators** — Every interactive element has a clear, high-contrast focus ring (never `outline: none` without replacement)
- **Keyboard operability** — All interactive elements reachable and operable via keyboard
- **Target size** — Click/tap targets at least 24×24 CSS pixels (44×44 preferred for mobile)
- **Semantic HTML** — Proper heading hierarchy, landmarks, labeled inputs, list elements
- **DOM order = visual order** — Source order matches reading flow
- **Motion safety** — Respect `prefers-reduced-motion`, no content flashing more than 3×/sec
- **Form labels** — Every input has a visible, associated label (not just placeholder text)
- **Language** — `lang` attribute on `<html>`

When the Accessibility skill and another design goal conflict (e.g., a subtle low-contrast text treatment looks elegant but fails contrast), **accessibility wins.** Find a design solution that meets both — never sacrifice accessibility for aesthetics.

---

## Interactivity

- Implement basic interactions that demonstrate the component's behavior
- Click handlers, hover states, dropdown open/close, toggle states
- Keep JS minimal — just enough to show how it behaves
- No external dependencies — vanilla JS only

---

## Iteration Workflow

When the user provides feedback, **update the existing files in place**.

### "Kill Comp X"
- Remove the comp file and its entry from the viewer index.html
- Remove from `manifest.json` exploration comps array
- Note the removal in comp-set.md

### "Update Comp X to..."
- Modify the specific comp file per the feedback
- Preserve the comp label (descriptive name + letter) — don't renumber
- Note the iteration in comp-set.md
- No manifest changes needed (comp metadata unchanged)

### "Add a new comp that..."
- Create a new comp file with the next available label
- Add it to the viewer index.html
- Add to `manifest.json` exploration comps array
- Note in comp-set.md

### "Revise palette X"
- Edit the palette CSS file in `palettes/`
- No manifest changes needed unless renaming
- No comp regeneration needed

### "Approve this set"
- Move the entire comp set folder from `active/` to `approved/`
- Update `status` to `"approved"` and `path` to `approved/{name}` in manifest.json
- Update comp-set.md status

---

## Comp-Set Metadata (comp-set.md)

Every comp set includes a metadata file:

```markdown
# Comp Set: [Component Name]

**Screen Name**: [app screen this represents, e.g., "Home", "Settings"]
**Nav Selectors**: [CSS selectors for buttons that route here, or "unassigned"]
**Status**: active | approved
**Created**: YYYY-MM-DD
**Parent**: [parent exploration ID, if expansion] | none
**Source Comp**: [comp that was expanded, if expansion] | none
**Depth**: 0 | 1 | 2
**Palettes**: [list of palette IDs available]
**Related Feature**: [link to feature spec if applicable]

## Component Description
What this component is and what it does.

## Design Requirements
Specific requirements driving the design.

## Experience Location
Where in the application this component will live.

## Comp Log
| Comp | Status | Notes |
|------|--------|-------|
| Minimal Hero (A) | active | [description of this variation] |
| Bold Split Layout (B) | killed | [reason] |
| Card Grid Overview (C) | active | [description] |

## Iteration Log
| Date | Action | Details |
|------|--------|---------|
| | | |

## Sign-Off Notes
Which comp(s) were selected and why. Modifications to carry into implementation.
```

---

## Signaling Completion

**Before signaling**, run through the Completeness Checklist for the request type (New Exploration or Expansion). Every checkbox must be satisfied. If any artifact is missing — especially `manifest.json` updates and the exploration's `index.html` — create it now. Do not signal completion with missing files.

### Accessibility Audit

After building comps and before presenting them to the user, re-read the Accessibility skill (`.github/skills/design/accessibility.md`) and audit each comp against it. Check:

- [ ] Text contrast ratios computed (not eyeballed) — 4.5:1 body, 3:1 large text
- [ ] Non-text contrast verified — 3:1 for buttons, inputs, icons
- [ ] Debug contrast checker embedded in each comp's `<script>` block
- [ ] Focus indicators visible on every interactive element
- [ ] Keyboard navigation works — all interactive elements reachable via Tab
- [ ] Target sizes meet minimum — 24×24px (44×44 preferred)
- [ ] Semantic HTML — proper heading hierarchy, landmarks, labeled inputs
- [ ] No color-only information — status, errors, links use more than color
- [ ] `lang` attribute on `<html>`
- [ ] `prefers-reduced-motion` respected if animations are present

If any check fails, fix the comp before presenting. Do not defer accessibility fixes to a later pass.

### Presenting to User

When a comp set is ready for review:
1. Verify all checklist items are complete
2. Verify accessibility audit passes
3. Present comps to the user for feedback

When a comp set is approved:
1. Move to `approved/`
2. Update manifest.json and comp-set.md

---

## Context Files to Always Read

- `.github/style/design-system.md` — Visual design system for colors, typography, spacing
- `.github/schemas/comp-viewer-template.html` — The viewer template
- `.github/comps/manifest.json` — Current state of all explorations, palettes, flows
- The exploration report in `.github/ideation/explorations/` that triggered the request
