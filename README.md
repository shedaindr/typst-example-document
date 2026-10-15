# Typst Example Document

An example document written in [Typst](https://typst.app/), featuring:
- **Dark Mode Aesthetic**: Sleek monochrome layout with high contrast.
- **Multilingual Support**: Devanagari script and Nepali language support with font fallbacks (`Nirmala UI`, `Mangal`).
- **Mathematical Typesetting**: Gaussian distribution, matrices, integrals, and numbered equations.
- **Structured Elements**: Formatted comparison tables, code listings with syntax highlighting, and custom admonition boxes.

## Files

- `example.typ`: The source Typst document.
- `output.pdf`: Pre-compiled PDF output.

## Prerequisites

Install Typst:
```bash
winget install --id Typst.Typst -e
```

## Compilation

To compile to PDF:
```bash
typst compile example.typ output.pdf
```

To enable live re-compilation on file save:
```bash
typst watch example.typ
```
