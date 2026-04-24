# Mood Board Building

Build **mood boards** — curated collections of visual inspiration gathered from Pinterest that help establish direction before comp building begins. Mood boards are exploratory and pre-design. They exist to align on visual tone, color, layout patterns, materials, and prior art.

## When to Build a Mood Board

- User has a design idea and wants visual inspiration before comps
- User explicitly asks for inspiration or a mood board
- Before a major exploration when the design space is wide open
- User provides abstract direction ("something warm and inviting") that needs visual grounding

Mood boards are **optional** — if the user already has a clear direction or wants to jump straight to comps, skip them.

---

## Search Categories

For any design idea, plan searches across these inspiration axes. Pick 4-6 that are most relevant:

| Category | What to Search For | Example Queries |
|----------|-------------------|-----------------|
| **Color & Palette** | Color schemes, palette inspiration, color moods | "meditation app color palette", "calm blue green palette" |
| **Layout & Composition** | Page layouts, grid structures, spatial arrangements | "dashboard layout design", "card grid UI" |
| **Typography & Content** | Type treatments, heading styles, content hierarchy | "modern sans serif UI typography" |
| **Similar Solutions** | Existing apps/sites solving the same problem | "meditation app UI design", "mindfulness dashboard" |
| **Materials & Texture** | Surface treatments, backgrounds, depth, glassmorphism | "glassmorphism UI design", "soft gradient backgrounds" |
| **Mood & Atmosphere** | Abstract visual feel — photos, art, environments | "calm serene minimal aesthetic", "warm cozy digital" |
| **Components & Patterns** | Specific UI elements relevant to the idea | "floating action button design", "onboarding carousel UI" |
| **Iconography & Illustration** | Icon styles, illustration approaches | "line icon set minimal", "illustrated empty states" |

---

## Pinterest Search Process

Use the Playwright MCP tools to search Pinterest and capture images. Follow this workflow:

### Step 1: Navigate to Pinterest Search

```
Navigate to: https://pinterest.com/search/pins/?q={encoded_query}
```

Use `mcp_playwright_browser_navigate` to open Pinterest search with the query.

### Step 2: Wait for Images to Load

Use `mcp_playwright_browser_wait_for` to wait for pin images to render. Wait for the selector `div[data-test-id="pin"]` or `img[src*="pinimg.com"]`.

### Step 3: Scroll for More Results

Use `mcp_playwright_browser_evaluate` to scroll the page and trigger lazy-loading of more images. Scroll 2-3 times with pauses to load a good set.

### Step 4: Capture Image URLs

Use `mcp_playwright_browser_evaluate` to extract image URLs from the page. Target `img` elements within pin containers. Collect the `src` attributes — prefer the highest resolution available (look for `originals` or `736x` in the Pinterest CDN URL pattern).

Pinterest image URL patterns:
- `https://i.pinimg.com/originals/...` (highest res)
- `https://i.pinimg.com/736x/...` (good quality)
- `https://i.pinimg.com/564x/...` (medium)
- `https://i.pinimg.com/236x/...` (thumbnail — skip these)

Upgrade URLs by replacing `/236x/` or `/564x/` with `/736x/` for better quality.

### Step 5: Download Images

For each category, download 6-10 images locally. Use the terminal to download with PowerShell:

```powershell
Invoke-WebRequest -Uri $url -OutFile $localPath -Headers @{ "Referer" = "https://www.pinterest.com/" }
```

Save images to `.github/mood-boards/{board-name}/images/{category}/`.

### Step 6: Repeat Per Category

Run steps 1-5 for each search category, using different queries to get diverse results.

### Important Notes

- **Rate limiting**: Add brief pauses between searches to avoid being blocked
- **No login required**: Pinterest search results are publicly accessible
- **Image quality**: Prefer 736x resolution — good balance of quality and file size
- **Deduplication**: Skip images with duplicate URLs across categories
- **Fallback**: If Pinterest blocks or returns no results for a query, try alternative phrasing

---

## Directory Structure

```
.github/mood-boards/
├── manifest.json                    # Tracks all mood boards
├── {board-name}/
│   ├── index.html                   # Mood board viewer (from template)
│   ├── board.json                   # Board metadata and image manifest
│   └── images/
│       ├── color-palette/
│       │   ├── img-001.jpg
│       │   └── img-002.jpg
│       ├── layout/
│       │   ├── img-001.jpg
│       │   └── img-002.jpg
│       └── similar-solutions/
│           ├── img-001.jpg
│           └── img-002.jpg
```

### manifest.json (Mood Boards Root)

```json
{
  "boards": {
    "meditation-app": {
      "name": "Meditation App Inspiration",
      "concept": "A calm, minimal meditation app dashboard",
      "created": "2026-03-25",
      "status": "active",
      "path": "meditation-app",
      "categories": ["color-palette", "layout", "similar-solutions", "mood-atmosphere"],
      "imageCount": 32
    }
  }
}
```

### board.json (Per Board)

```json
{
  "name": "Meditation App Inspiration",
  "concept": "A calm, minimal meditation app dashboard",
  "direction": "Minimal, calm, soft gradients, lots of whitespace",
  "created": "2026-03-25",
  "categories": [
    {
      "id": "color-palette",
      "label": "Color & Palette",
      "query": "meditation app calm color palette",
      "images": [
        { "file": "images/color-palette/img-001.jpg", "source": "pinterest" },
        { "file": "images/color-palette/img-002.jpg", "source": "pinterest" }
      ]
    }
  ]
}
```

---

## First-Time Setup

On the first mood board creation:

1. Create `.github/mood-boards/` directory
2. Create `.github/mood-boards/manifest.json` with empty `boards` object
3. Ensure the Playwright browser is installed (use `mcp_playwright_browser_install` if needed)

---

## Board Assembly

After collecting all images:

1. Generate `board.json` with full metadata and per-category image lists
2. Generate `index.html` from `.github/schemas/mood-board-template.html`:
   - Replace `{{BOARD_ID}}` with the board's kebab-case ID
   - Replace `{{BOARD_NAME}}` with the human-readable name
   - Replace `{{BOARD_CONCEPT}}` with the concept description
3. Register the board in `.github/mood-boards/manifest.json`

---

## Completeness Checklist

Before signaling completion of any mood board, verify:

- [ ] `.github/mood-boards/{board-name}/` folder exists
- [ ] At least 4 categories searched, each with 4+ images downloaded
- [ ] `board.json` created with all categories and image references
- [ ] Every image referenced in `board.json` exists on disk
- [ ] `index.html` generated from template with correct board ID
- [ ] `.github/mood-boards/manifest.json` updated with board entry

---

## Serving Mood Boards

Mood boards are served via the same comp viewer server. They're accessible at:

```
http://localhost:3333/../mood-boards/{board-name}/
```

Or the user can open the HTML file directly in a browser since all images are local.
