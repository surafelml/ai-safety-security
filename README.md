# AI Safety & Security

> *Foundations to the Agentic Frontier* — a living, continuously evolving reference for the
> **safety and security of agentic systems**.

Agentic systems are the bridge between AI safety and AI security: tool-use is the
security surface, autonomy is the safety problem. As systems are increasingly optimized
to be agentic, this intersection is where the most impactful problems now sit. This repo
is the canonical reference for that seam.

## The four-mode pipeline

```
  book chapter  ──►  arXiv review paper  ──►  topic blog  ──►  OSS R&D project
  (distilled        (adds a novel             (spin-off,        (best practices,
   substrate)        synthesis/argument)       cross-posted)     tools)
```

A book chapter is the substrate. A paper is *not* a chapter — it is a focused review with a
declared **novel delta** beyond the chapter (see [research/](research/)). Blogs spin off
individual topics; projects ship reusable artifacts.

## How to read the book

Organized **by topic (primary axis), chronologically within each topic**:

- **Part I — Foundations:** read-once orientation → [book/foundations/landscape.qmd](book/foundations/landscape.qmd)
- **Part II — Topics:** the living core (alignment, robustness & security, interpretability, monitoring & oversight, and the flagship **agentic safety × security**)
- **Part III — Frontier:** rolling intake of the last ~12 months; items migrate into topics as they mature

Content rule: **distill** core concepts, illustrations, and formalizations — never dump source papers.

## Repo layout

| Path | Contents |
|------|----------|
| [book/](book/) | Quarto book (`quarto preview book/` to build) |
| [research/](research/) | arXiv review-paper exports, one dir per paper |
| [projects/](projects/) | Open-source safety/security R&D |

## Build

```bash
quarto preview book/      # live preview
quarto render book/       # build to _site/
```

## License

[MIT](LICENSE).
