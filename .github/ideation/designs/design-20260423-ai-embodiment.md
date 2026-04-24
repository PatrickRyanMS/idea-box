# Design Document: AI Embodiment — Interactive Personal Assistant

**Document ID**: design-20260423-ai-embodiment
**Date**: 2026-04-23
**Status**: draft
**Author**: Klee (with user)
**Scope**: project
**Parent**: none

---

## Overview

A mobile-first interactive AI experience where a personal assistant helps users organize their projects, thoughts, and time. The core design challenge is the **embodiment** — an abstract, non-figurative visual presence that implies intelligence and cognition without relying on a face or character. The embodiment must communicate agent state (listening, thinking, speaking, waiting) through subtle non-verbal cues — motion, color, scale, and position — so the interaction feels alive and intentional rather than disembodied.

The experience supports equal voice and chat modes. Voice is the expected primary entry point, with chat serving as both an accessibility path and a channel for richer data exchange (photos, documents).

## Goals

- Create an abstract visual embodiment that implies intelligence and thought — not a character, but a *presence*
- Communicate agent state clearly through non-verbal visual cues (motion, color, size, position)
- Design equal-weight voice and chat interaction modes within a single unified experience
- Achieve a modern, minimal aesthetic that remains warm and inviting for daily personal use
- Mobile-first design that feels natural on phone screens
- Enticing enough that users want to engage — not sterile or clinical

## Non-Goals

- Skeuomorphic or figurative design — no faces, avatars, or anthropomorphic features
- Desktop-first or desktop-only layouts
- Technical architecture or implementation planning (visual design only)
- Production-ready code (comps are design artifacts, not shippable)
- Designing the backend AI capabilities or conversation logic

## User Experience

### Scenario: Voice Conversation — Morning Planning

1. User opens the app and sees the embodiment in its idle/waiting state — calm, subtly alive
2. User taps a microphone action or speaks a wake phrase; embodiment shifts to **listening** state
3. User says "What do I have today?"
4. Embodiment transitions to **thinking** state — a visible shift in motion/energy
5. Embodiment transitions to **speaking** state as the agent responds with the day's agenda
6. Agent finishes speaking; embodiment returns to **listening** or **waiting** state depending on conversational context

### Scenario: Chat Mode — Sharing a Document

1. User switches to chat mode (or starts in chat mode)
2. Embodiment remains visible but compact, anchoring the top of the conversation
3. User types a message or attaches a photo/document
4. Embodiment reacts subtly to incoming input — acknowledging receipt
5. Agent responds in text; embodiment shifts through thinking → responding states
6. Conversation thread scrolls naturally with the embodiment as a persistent presence

### Scenario: State Awareness

1. At any moment, the user can glance at the embodiment and know: is the agent listening to me? Processing? About to speak? Waiting for me?
2. State transitions are smooth and organic — no jarring switches
3. Subtle enough to read unconsciously (like reading body language) but clear enough to never leave the user confused about whose turn it is

## Design Direction

> To be refined through mood board and exploration. Initial direction:

### Visual Language
- **Abstract form** — could be luminous, fluid, particle-based, geometric, atmospheric, or a blend
- **Non-figurative** — no face, body, or anthropomorphic features
- **Alive** — continuous subtle motion even in idle state; never static
- **Responsive** — form reacts to user input and agent state changes

### State Expression (To Explore)
| State | Possible Cues |
|-------|--------------|
| **Idle / Waiting** | Calm, slow breathing rhythm, low energy, settled position |
| **Listening** | Oriented toward user, subtle reactivity to voice amplitude, attentive energy |
| **Thinking** | Increased internal motion, complexity, density — visible processing |
| **Speaking** | Rhythmic motion tied to speech cadence, outward energy, expanded presence |

### Tone
- Modern and minimal, but not cold
- Enticing — draws the user in, makes them want to interact
- Personal assistant warmth — this is a daily companion, not a corporate tool

### Visual Reference

- Mood board: `.github/mood-boards/ai-embodiment/` *(to be built)*
- Comp folder: `.github/comps/active/` *(to be built)*

## Design Constraints

- **Mobile-first**: Primary design target is phone screens (375–430pt width)
- **Dual interaction modes**: Voice and chat must coexist as equal modes within the same UI
- **Accessibility**: WCAG 2.2 AA compliance — embodiment states must be perceivable through means beyond color alone; chat mode must be fully accessible
- **State clarity**: Users must always be able to determine agent state at a glance
- **Performance**: Embodiment animations must feel smooth — design should consider what's achievable in real-time rendering on mobile devices

## Open Questions

- [ ] What abstract form language best implies intelligence? (fluid, particle, geometric, light-based, hybrid?)
- [ ] How much screen real estate does the embodiment occupy in voice mode vs. chat mode?
- [ ] Should the embodiment have a consistent shape that modulates, or should it transform more dramatically between states?
- [ ] What color direction supports "modern yet enticing" for a personal assistant?
- [ ] How does the transition between voice and chat modes work spatially? Does the embodiment shrink/move, or does the layout restructure?
- [ ] Should the embodiment respond to ambient context (time of day, user mood) or only to direct interaction?

## Resolved Questions

| Question | Decision | Rationale |
|----------|----------|-----------|
| Figurative or abstract? | Abstract | Avoids uncanny valley; implies intelligence without faking humanity |
| Primary audience? | Consumer — personal assistant users | Shapes tone: warm, personal, daily-use |
| Voice or chat primary? | Equal modes, voice as likely entry point | Accessibility + richer data exchange via chat |
| State communication method? | Non-verbal visual cues (motion, color, size, position) | Mirrors how humans read body language — subtle but effective |

## Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Abstract form feels meaningless or decorative | Users ignore the embodiment, defeating its purpose | Ground form changes in clear state logic; user test for readability |
| Too subtle state changes | Users can't tell what the agent is doing | Test with users unfamiliar with the system; ensure at least 2 cue dimensions per state |
| Motion/animation feels heavy on mobile | Poor performance, battery drain, janky feel | Design with mobile rendering constraints in mind; provide reduced-motion alternatives |
| Voice + chat mode switching feels disjointed | Broken experience, confusion about mode | Design a unified layout that accommodates both rather than two separate screens |
| "Modern minimal" becomes sterile | Users don't feel warmth or connection | Mood board to establish warmth cues; explore color temperature and organic motion |

## Design Scope

- [ ] Embodiment form language and motion system
- [ ] Agent state visualization (idle, listening, thinking, speaking)
- [ ] Voice mode layout (embodiment-dominant)
- [ ] Chat mode layout (conversation + embodiment)
- [ ] Voice ↔ chat mode transition
- [ ] Mobile responsive behavior

## Child Design Documents

| Feature | Design Doc | Status |
|---------|-----------|--------|
| Embodiment Form & Motion | *TBD — after mood board* | not started |
| Voice Mode Experience | *TBD — after mood board* | not started |
| Chat Mode Experience | *TBD — after mood board* | not started |
| Mode Transition | *TBD — after mood board* | not started |

## Design Cycle Log

| Cycle | Agent | Action | Outcome |
|-------|-------|--------|---------|
| 1 | Klee | Initial design conversation | Captured direction: abstract embodiment, dual-mode, state-driven motion, modern/warm tone |
| 1 | Klee | Mood board (next) | *In progress* |

---

## Sign-Off

> **This design document requires explicit user approval before any intake reports are written.** Review every section above. Edit anything that needs changing. When ready, tell the agent to proceed.

- [ ] **User approved** — date:
