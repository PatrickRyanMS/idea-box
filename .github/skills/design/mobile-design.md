# Skill: Designing for Mobile

Reference knowledge for designing mobile user interfaces. Use this when building mobile-targeted comps, evaluating mobile layouts, writing exploration briefs for mobile features, or advising on touch-first design decisions.

---

## Why Mobile Matters

Over 52% of web traffic comes from mobile devices. Users expect sleek, fast, visually appealing mobile experiences for everything from shopping to exercising to reading. Mobile isn't a secondary viewport — it's the primary one for most people.

**Mobile design constraints:**
- Limited screen real estate
- Touch-based interactions (no hover states, no precise cursor)
- Varying device sizes, orientations, and resolutions
- Diverse usage contexts (one-handed, on the move, in bright sunlight)
- Variable network speeds

**Mobile design advantages:**
- Touch gestures (swipe, pinch, tap) enable more immersive interactions than click-only
- Devices go where users go — contextually relevant, real-time experiences
- Smaller screens force focus — less clutter, more intentional design

---

## 5 Core Practices

### 1. Mobile-First Design

Design for the smallest screen first, then scale up — not the other way around.

- **Start with constraints**: Embrace limited space, touch input, and variable network speeds from the beginning
- **Prioritize ruthlessly**: Decide what's essential vs. what can be hidden, deferred, or removed entirely
- **Force lean decisions**: Small screens don't tolerate bloat — every element must earn its place
- **Avoid desktop-then-shrink**: Adapting a desktop layout to mobile always produces a worse result than designing mobile-first

**Rule**: If it doesn't work on a 375px-wide screen, it shouldn't exist in the design yet. Get mobile right first, then expand.

### 2. Streamlined Navigation

Mobile navigation must be concise, organized, and immediately understandable.

- **Simple menu structures** — Avoid deep nesting; flat hierarchies work best on mobile
- **Clear labels** — Short, descriptive text; no ambiguous icons without labels
- **Recognizable icons** — Use standard platform conventions (hamburger, back arrow, tab bar)
- **Gesture-based shortcuts** — Swipe to go back, pull to refresh, pinch to zoom — but always provide visible alternatives
- **Reduce steps** — Every tap is a barrier; minimize the number of taps to reach any content
- **Persistent navigation** — Key navigation should remain accessible (bottom tab bar, sticky header)

**Rule**: If a user needs to think about how to get somewhere, the navigation has failed. On mobile, cognitive load from navigation is amplified because users are often distracted or multitasking.

### 3. Responsive Layouts

Design layouts that adapt gracefully across the full range of mobile devices.

- **Responsive grids** — Use fluid grids that adjust content based on screen width, not fixed breakpoints alone
- **Fluid typography** — Font sizes and line lengths should scale with the viewport for consistent legibility
- **Flexible images** — Images should resize proportionally; never overflow or get cropped unexpectedly
- **Orientation awareness** — Layouts should work in both portrait and landscape without breaking
- **Safe areas** — Account for notches, rounded corners, home indicators, and status bars on modern devices

**Rule**: Test on real devices across sizes. Simulator-only testing misses real-world issues like touch target feel, text readability at arm's length, and device-specific rendering quirks.

### 4. Content Hierarchy

Limited screen space demands strict prioritization of information.

- **Headings and typography** — Use size, weight, and spacing to establish clear visual levels
- **Color as hierarchy signal** — High-contrast elements for primary content, subdued tones for secondary
- **Progressive disclosure** — Break information into digestible chunks; reveal detail on demand
- **Scannable structure** — Users scan on mobile even more than on desktop; use short paragraphs, bullet lists, and clear section breaks
- **Above-the-fold focus** — The most important content and primary action should be visible without scrolling

**Rule**: If the user has to scroll past secondary content to find the primary action, the hierarchy is wrong.

### 5. Touch-Optimized Interactions

Every element must be designed for fingers, not cursors.

- **Minimum touch targets** — 44×44pt minimum (Apple HIG) / 48×48dp (Material Design); bigger is better
- **Adequate spacing** — Enough room between interactive elements to prevent accidental taps
- **Feedback on every tap** — Visual response (color change, ripple, animation) confirms the interaction registered
- **Microinteractions** — Small animations that acknowledge user actions (toggle switches, pull-to-refresh, swipe confirmations)
- **Thumb-friendly zones** — Place primary actions within natural thumb reach (bottom of screen, center-bottom area)
- **Avoid hover-dependent UI** — No tooltips, dropdown-on-hover, or hover-only reveals; everything must work with tap/long-press

**Rule**: If an element is tappable, it must look tappable, feel tappable (adequate size), and respond to the tap (visual feedback). All three.

---

## Mobile Design Patterns Worth Studying

| App | What It Does Well | Lesson |
|-----|-------------------|--------|
| **Duolingo** | Bite-sized content, gamification, instant visual feedback, clear hierarchy | Break content into small chunks; make interactions delightful |
| **Todoist** | Minimalistic interface, clean hierarchy, intuitive task management | Simplicity helps users stay focused and confident |
| **Spotify** | Rich visual design (album art, colors), cross-device continuity, gesture-based interactions | Let visual content shine; animations increase engagement |
| **Blinkist** | Clean typography, adjustable font sizes, distraction-free reading, clear visual hierarchy | Prioritize readability and accessibility in content-heavy apps |
| **Uber** | Essential elements only, clear real-time information, simple decision flow | Simplicity enables confident decisions under time pressure |

---

## Mobile-Specific Considerations

### One-Handed Use
Most people use their phone one-handed. The "thumb zone" (the arc your thumb can comfortably reach) should contain:
- Primary actions (CTAs, submit buttons)
- Core navigation (tab bar)
- Frequently used controls

Hard-to-reach areas (top corners) are appropriate for:
- Settings and account access
- Secondary actions
- Infrequent controls

### Performance as Design
On mobile, speed is a design choice:
- Skeleton screens feel faster than spinners
- Optimistic UI (show the result before confirming with the server) reduces perceived latency
- Lazy-load content below the fold
- Compress images for mobile bandwidth

### Platform Conventions
Respect platform-specific patterns:
- **iOS**: Back swipe from left edge, bottom tab bar, large titles, pull-down modals
- **Android**: Material Design components, bottom navigation, FAB (floating action button), back button behavior
- **Cross-platform**: Choose one set of conventions and be consistent; don't mix iOS and Android patterns

### Orientation and Context
- Support both portrait and landscape where it makes sense (video, maps, forms)
- Lock orientation only when there's a clear UX reason
- Consider usage context: bright sunlight (need high contrast), walking (need large targets), quick glances (need scannable content)

---

## Mobile Design Checklist

Before presenting a mobile comp, verify:

- [ ] **Mobile-first** — Was this designed for mobile first, not adapted from desktop?
- [ ] **Touch targets** — Are all interactive elements at least 44×44pt with adequate spacing?
- [ ] **Thumb zone** — Are primary actions reachable with one thumb?
- [ ] **Navigation** — Is it simple, persistent, and learnable in seconds?
- [ ] **Content hierarchy** — Is the most important content visible without scrolling?
- [ ] **Responsive** — Does the layout work across phone sizes and orientations?
- [ ] **Feedback** — Do all interactive elements provide visual feedback on tap?
- [ ] **No hover dependencies** — Does everything work without a cursor?
- [ ] **Performance** — Are images optimized? Is content loading strategy considered?
- [ ] **Platform conventions** — Does the design respect the target platform's patterns?
- [ ] **Readability** — Is text legible at mobile viewing distances? Adequate contrast?
- [ ] **Safe areas** — Does the layout account for notches, home indicators, and status bars?

---

## Quick-Reference Terminology

| Term | Definition |
|------|-----------|
| **Mobile-first** | Design strategy that starts with the smallest screen and scales up |
| **Thumb zone** | The area of the screen comfortably reachable by the user's thumb |
| **Touch target** | The tappable area of an interactive element (minimum 44×44pt) |
| **Responsive grid** | A flexible layout system that adapts to different screen sizes |
| **Fluid typography** | Text sizing that scales proportionally with viewport width |
| **Progressive disclosure** | Revealing information gradually as the user needs it |
| **Microinteraction** | A small animation that provides feedback for a user action |
| **Skeleton screen** | A placeholder layout shown while content loads |
| **Optimistic UI** | Showing the expected result immediately, before server confirmation |
| **Safe area** | The portion of the screen not obscured by device hardware (notches, corners) |
| **Viewport** | The visible area of a web page or app on a device screen |
| **Breakpoint** | A screen width at which the layout changes to accommodate the size |
| **FAB** | Floating Action Button — a Material Design pattern for the primary action |
| **HIG** | Human Interface Guidelines — Apple's design system documentation |
