# Skill: Fluent Icons

Procedural knowledge for sourcing Fluent System Icons as SVG files. Use this when a design needs icons — for comps, UI mockups, or any visual that calls for iconography.

The icon source is the **`@fluentui/svg-icons`** npm package (from [`microsoft/fluentui-system-icons`](https://github.com/microsoft/fluentui-system-icons), MIT license). It contains every Fluent System Icon as an optimized SVG file — no browser automation required.

---

## Icon Library at a Glance

- **~8,500 icons** covering UI, navigation, status, objects, actions, and more
- **Two styles**: `regular` (outlined) and `filled` (solid)
- **Sizes**: 12, 16, 20, 24, 28, 32, 48 (not every icon has every size)
- **Naming convention**: lowercase, underscore-separated

---

## Method 1 — npm Package (primary)

### Install

```bash
npm install @fluentui/svg-icons
```

### Access Icons

After install, every icon is available as a file:

```
node_modules/@fluentui/svg-icons/icons/{name}_{size}_{style}.svg
```

Examples:

```
@fluentui/svg-icons/icons/add_24_regular.svg
@fluentui/svg-icons/icons/home_24_filled.svg
@fluentui/svg-icons/icons/person_20_regular.svg
@fluentui/svg-icons/icons/settings_28_filled.svg
@fluentui/svg-icons/icons/arrow_left_16_regular.svg
@fluentui/svg-icons/icons/chat_sparkle_24_regular.svg
```

### Naming Rules

| Part | Format | Examples |
|------|--------|----------|
| Name | `lowercase_underscore` | `add`, `arrow_left`, `chat_sparkle`, `document_bullet_list` |
| Size | number | `12`, `16`, `20`, `24`, `28`, `32`, `48` |
| Style | `regular` or `filled` | `regular`, `filled` |

Full pattern: **`{name}_{size}_{style}.svg`**

Multi-word icon names use underscores. To convert from the display name (e.g., "Chat Sparkle") to filename: lowercase and replace spaces with underscores → `chat_sparkle`.

### Finding Icon Names

If you're unsure of the exact filename, list matching files:

```bash
# Find all "home" icons
ls node_modules/@fluentui/svg-icons/icons/home_*

# Find all 24px regular icons matching "arrow"
ls node_modules/@fluentui/svg-icons/icons/arrow_*_24_regular.svg

# Find all chat-related icons
ls node_modules/@fluentui/svg-icons/icons/chat_*
```

### Copy to Project

Read the SVG file content and save it to the project's icon directory:

```bash
# Copy a single icon
cp node_modules/@fluentui/svg-icons/icons/home_24_regular.svg assets/icons/home.svg
```

Or read the file content directly and create it with whatever filename the project convention requires.

---

## Method 2 — GitHub Raw URLs (fallback)

Use this when the npm package is not installed and cannot be installed (e.g., no `package.json` in the project).

### Repository Structure

```
microsoft/fluentui-system-icons
└── assets/
    └── {Icon Name}/          ← Title Case with spaces
        ├── SVG/
        │   ├── ic_fluent_{name}_{size}_{style}.svg
        │   └── ...
        ├── PDF/
        └── metadata.json
```

### Raw URL Pattern

```
https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/{Folder Name}/SVG/ic_fluent_{name}_{size}_{style}.svg
```

Examples:

```
https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/Add/SVG/ic_fluent_add_24_regular.svg
https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/Home/SVG/ic_fluent_home_24_filled.svg
https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/Chat Sparkle/SVG/ic_fluent_chat_sparkle_24_regular.svg
https://raw.githubusercontent.com/microsoft/fluentui-system-icons/main/assets/Arrow Left/SVG/ic_fluent_arrow_left_16_regular.svg
```

### Naming Differences from npm

| Part | npm package | GitHub assets |
|------|------------|---------------|
| Path name | `{name}_{size}_{style}.svg` | `ic_fluent_{name}_{size}_{style}.svg` |
| Folder | flat under `icons/` | `assets/{Title Case Name}/SVG/` |

Folder names use **Title Case with spaces** (e.g., `Arrow Left`, `Chat Sparkle`, `Document Bullet List`). The SVG filenames inside use **`ic_fluent_` prefix** + the same `{name}_{size}_{style}` pattern.

### Fetching

Use `fetch_webpage` or any HTTP tool to download the raw SVG content from the URL, then save it to the project.

---

## Size Guide

| Size | Use For |
|------|---------|
| 12px | Inline indicators, badges |
| 16px | Small UI elements, list items |
| 20px | Default body-text-adjacent icons |
| 24px | **Default / most common.** Navigation, toolbars, cards |
| 28px | Emphasized UI elements |
| 32px | Section headers, feature callouts |
| 48px | Hero areas, empty states, onboarding |

When in doubt, use **24px regular** as the default.

---

## Search Tips

| Strategy | Example |
|----------|---------|
| Start generic | Search for `arrow_*` before `arrow_circle_down_right_*` |
| Try synonyms | `person` vs `people` vs `contact` |
| Use ls/glob to discover | `ls icons/chat_*` shows all chat variants |
| Check both styles | Some icons read better as `filled`, others as `regular` |
| Browse the repo | [github.com/microsoft/fluentui-system-icons/tree/main/assets](https://github.com/microsoft/fluentui-system-icons/tree/main/assets) lists all icon folders alphabetically |

---

## Checklist

Before selecting an icon, verify:

1. The icon **visually communicates the intended concept** at the size it will be used
2. The **size matches the use case** (see size guide above)
3. The **style** (regular vs filled) is consistent with other icons in the design
4. If the design uses multiple icons, they all come from **Fluent System Icons** for visual consistency
5. The SVG file is saved with a **descriptive filename** following project conventions
