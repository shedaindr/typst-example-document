// Document setup and page layout - Dark Mode (Black & White)
#set page(
  paper: "a4",
  fill: black,
  margin: (x: 2.5cm, top: 2.3cm, bottom: 2.3cm),
  header: align(right)[
    #text(8.5pt, fill: luma(180))[Typst Example Document]
  ],
  footer: context [
    #align(center)[
      #text(8.5pt, fill: luma(180))[
        Page #counter(page).display("1") of #counter(page).final().first()
      ]
    ]
  ],
)

// Global typography and paragraph rules (with cross-platform Devanagari font fallback)
#set text(
  font: ("Times New Roman", "Devanagari MT", "Kohinoor Devanagari", "Noto Sans Devanagari", "Nirmala UI", "Mangal"),
  size: 10.5pt,
  fill: white,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.68em,
)

// Clean white underlined links
#show link: it => underline(text(fill: white)[#it])

// Enable equation numbering for numbered math formulas
#set math.equation(numbering: "(1)")

// Headings in bold white
#show heading.where(level: 1): it => block(below: 0.8em)[
  #v(0.6em)
  #text(fill: white, weight: "bold", size: 13.5pt)[#it.body]
]

#show heading.where(level: 2): it => block(below: 0.6em)[
  #v(0.4em)
  #text(fill: luma(220), weight: "bold", size: 11.5pt)[#it.body]
]

// Reusable admonition component
#let callout(title: "Note", body) = block(
  width: 100%,
  stroke: (left: 3.5pt + white, rest: 0.5pt + luma(70)),
  fill: luma(25),
  inset: (x: 12pt, y: 9pt),
  radius: 3pt,
  [
    #text(weight: "bold", fill: white)[#title] \
    #v(0.2em)
    #body
  ],
)

// Code block styling
#show raw.where(block: true): it => block(
  fill: luma(22),
  inset: 9pt,
  radius: 4pt,
  stroke: 0.5pt + luma(60),
  width: 100%,
  it,
)

// ==========================================
// PAGE 1: Title, Abstract, Introduction
// ==========================================

#align(center)[
  #text(22pt, weight: "bold", fill: white)[Introduction to Typst] \
  #v(0.3em)
  #text(11.5pt, fill: luma(200), style: "italic")[A modern, expressive, and blazing-fast typesetting system] \
  #v(0.9em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    align: center,
    [
      *Dr. Jane Doe* \
      Department of Computer Science \
      #link("mailto:jane.doe@example.com")[jane.doe\@example.com]
    ],
    [
      *Alex Smith* \
      Institute of Applied Physics \
      #link("mailto:alex.smith@example.com")[alex.smith\@example.com]
    ],
  )
  
  #v(0.6em)
  #text(9.5pt, fill: luma(180))[#datetime.today().display("[month repr:long] [day], [year]")]
]

#v(0.6em)

// Abstract block (Dark Mode)
#align(center)[
  #block(
    width: 95%,
    stroke: (left: 3pt + white, rest: 0.5pt + luma(60)),
    inset: (x: 12pt, y: 9pt),
    fill: luma(25),
    radius: (right: 3pt),
    align(left)[
      #text(weight: "bold", fill: white)[Abstract] --- 
      This document serves as a comprehensive, idiomatic showcase of modern document authoring in *Typst*. We demonstrate essential capabilities including page layout control, typographic conventions, complex mathematical expressions, formatted tables, syntax-highlighted code blocks, programmatic layouts, cross-referencing, and multilingual typesetting with native Nepali (Devanagari script) support, styled in a refined dark mode aesthetic.
    ],
  )
]

#v(0.4em)

= 1. Introduction

Typst is a markup-based typesetting system designed to deliver the formatting power and precision of LaTeX alongside the intuitiveness and velocity of Markdown. Built from the ground up in Rust, Typst redefines how technical manuscripts, research papers, textbooks, and reports are created.

== 1.1 Architectural Advantages

Traditional typesetting tools often suffer from prolonged compile cycles, cryptic error messages, and intricate macro dependencies. Typst addresses these pain points with a clean architecture:

- *Instant Compilation*: Typst compiles documents in tens of milliseconds. With incremental rendering, edits are visible in real-time as you type.
- *Unified Paradigm*: Typst unifies text markup, mathematical typography, and code scripting into one coherent language.
- *Modern Layout Engine*: Dynamic flow layouts, multi-column regions, and pixel-perfect vector geometry are built directly into the core engine.
- *Hermetic Reproducibility*: Self-contained document execution ensures that documents produce identical results across platforms without external TeX distributions.

== 1.2 Syntax and Typographic Foundations

Typst features a concise, distraction-free syntax for daily writing:
- *Bold emphasis* is declared with `*bold*`
- _Italicized emphasis_ is declared with `_italic_`
- `Monospaced text` is written with backticks
- Bulleted lists use simple hyphens (`-`), while ordered items use numbering (`+`)
- Footnotes can be inserted naturally anywhere in the body text#footnote[Typst automatically calculates footnote positioning, separators, and page numbering.]

#pagebreak()

// ==========================================
// PAGE 2: Mathematics, Tables, and Figures
// ==========================================

= 2. Mathematical Typesetting

Mathematical formulas in Typst are enclosed within dollar signs (`$`). Inline equations integrate smoothly into running text: $E = m c^2$, Euler's identity $e^(i pi) + 1 = 0$, or the summation formula $sum_(i=1)^n i = (n(n+1)) / 2$.

Block equations are created by placing whitespace or linebreaks inside `$ ... $`, and automatic equation numbering is enabled effortlessly:

$
  f(x) = 1 / (sigma sqrt(2 pi)) e^(- 1/2 ((x - mu) / sigma)^2)
$ <eq:gaussian>

We can reference this Gaussian probability distribution cleanly using @eq:gaussian. Typst also offers concise syntax for matrix notation, linear transformations, and calculus:

$
  bold(M) = mat(
    cos(theta), -sin(theta), 0;
    sin(theta),  cos(theta), 0;
    0, 0, 1;
  )
$ <eq:matrix>

Advanced mathematical formulations, such as the continuous Fourier Transform in @eq:fourier, retain remarkable legibility in source markup:

$
  cal(F){f(t)} = hat(f)(omega) = integral_(-infinity)^infinity f(t) e^(-i omega t) dif t
$ <eq:fourier>

Common limits and definite integrals are structured with clear semantic operators:

$
  lim_(x -> 0) (sin(x)) / x = 1, quad integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2, quad nabla times bold(E) = - (partial bold(B)) / (partial t)
$

= 3. Tables and Comparative Figures

Tables in Typst are declared with the `#table` function and can be wrapped in `#figure` for automated numbering, captions, and inclusion in outlines:

#figure(
  table(
    columns: (1fr, 1.4fr, 1.2fr),
    inset: 7pt,
    align: (left, left, center),
    stroke: (x, y) => if y == 0 { (bottom: 1.5pt + white) } else { 0.5pt + luma(70) },
    fill: (x, y) => if y == 0 { luma(35) } else if calc.even(y) { luma(20) } else { none },
    table.header([*Evaluation Metric*], [*Typst Approach*], [*Traditional LaTeX*]),
    [Compilation Speed], [Under 100 ms (Incremental)], [Multi-second multi-pass],
    [Syntax Simplicity], [Clean, Markdown-inspired], [Heavy macro declarations],
    [Package Management], [Built-in Universe registry (`@preview`)], [CTAN / TeX Live archive],
    [Error Diagnostics], [Precise traces with file pointers], [Cryptic low-level TeX errors],
    [Programming Model], [Pure functions and closures], [Macro expansions & `\def`],
  ),
  caption: [Systematic comparison between Typst and traditional LaTeX typesetting workflows.],
) <tab:comparison>

#figure(
  table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    inset: 6.5pt,
    align: (left, center, center, center),
    stroke: (x, y) => if y == 0 { (bottom: 1.5pt + white) } else { 0.5pt + luma(70) },
    fill: (x, y) => if y == 0 { luma(35) } else if calc.even(y) { luma(20) } else { none },
    table.header([*Document Size*], [*Pages*], [*Typst Build Time*], [*LaTeX Build Time*]),
    [Short Technical Paper], [4 pages], [24 ms], [1,420 ms],
    [Master Thesis], [85 pages], [115 ms], [4,850 ms],
    [Comprehensive Book], [320 pages], [340 ms], [12,900 ms],
  ),
  caption: [Benchmark measurements highlighting incremental build performance.],
) <tab:benchmarks>

As demonstrated in @tab:comparison and @tab:benchmarks, Typst dramatically shortens iteration cycles while maintaining uncompromising typesetting quality.

#pagebreak()

// ==========================================
// PAGE 3: Code, Scripting, and Components
// ==========================================

= 4. Syntax-Highlighted Code Listings

Typst includes built-in support for syntax highlighting across hundreds of programming languages, powered by tree-sitter. Listings blend seamlessly into the dark mode palette:

```python
def compute_fibonacci(limit: int) -> list[int]:
    """Generate Fibonacci sequence up to limit items with memoization."""
    fib: list[int] = [0, 1]
    while len(fib) < limit:
        fib.append(fib[-1] + fib[-2])
    return fib

# Compute first 10 Fibonacci numbers and display output
if __name__ == "__main__":
    sequence = compute_fibonacci(10)
    print(f"Computed sequence: {sequence}")
```

= 5. Document Automation and Scripting

Unlike legacy macro processors, Typst provides a full functional scripting language. You can store values in variables, define functions with `#let`, map over arrays, and generate layout elements programmatically:

#let tech-badge(name, category) = box(
  fill: luma(30),
  stroke: 0.5pt + luma(70),
  radius: 3pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(weight: "bold", fill: white, size: 8.5pt)[#name]
    #h(4pt)
    #text(fill: luma(160), size: 7.5pt)[(#category)]
  ]
)

#let features = (
  ("Pure Rust Core", "Engine"),
  ("Tree-Sitter Syntax", "Tooling"),
  ("Instant Watch Mode", "Workflow"),
  ("Unicode First", "Typography"),
  ("Predictable Rules", "Language"),
  ("Zero-Config PDF", "Compiler"),
)

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    ..features.map(f => tech-badge(f.at(0), f.at(1)))
  )
]

= 6. Reusable Visual Components

Typst's composable function architecture makes it straightforward to encapsulate reusable design components, such as notices, admonitions, and callout boxes:

#callout(title: "Compilation Tip")[
  Execute `typst watch example.typ` in your terminal to enable automatic live re-compilation. Every time you save the file, the PDF is regenerated in milliseconds and refreshed in your viewer.
]

#v(0.3em)

#callout(title: "Architecture Note: Incremental Memoization")[
  Typst's compiler uses pure function evaluations and dependency graphs. Only sections of the document affected by your latest modification are recomputed, ensuring instantaneous feedback even on large multi-chapter volumes.
]

#pagebreak()

// ==========================================
// PAGE 4: Multilingual, Workflow, Conclusion
// ==========================================

= 7. नेपाली भाषा समर्थन र देवनागरी लिपि (Multilingual Support)

टाइपस्ट (Typst) ले युनिकोड (Unicode) र देवनागरी लिपिलाई पूर्ण रूपमा समर्थन गर्दछ। बहु-भाषिक फन्टहरूको स्वचालित व्यवस्थापन (_Font Fallback_) का कारण नेपाली तथा अन्य देवनागरी भाषाहरू कुनै अतिरिक्त जटिलता बिना स्पष्ट र सुन्दर रूपमा प्रस्तुत हुन्छन्।

#block(
  width: 100%,
  stroke: (left: 3.5pt + white, rest: 0.5pt + luma(70)),
  fill: luma(25),
  inset: (x: 12pt, y: 9pt),
  radius: 3pt,
  [
    #text(weight: "bold", fill: white)[नेपाली सारांश:] \
    #v(0.2em)
    टाइपस्ट एक अत्याधुनिक, तीव्र र शक्तिशाली कागजात ढाँचा (typesetting) प्रणाली हो। यसले अनुसन्धान पत्र, प्रतिवेदन, पुस्तक तथा प्राविधिक लेखहरू तयार गर्न अत्यन्त सहज र प्रभावकारी वातावरण प्रदान गर्दछ। नेपाली लिपिमा जटिल संयुक्त अक्षरहरू (जस्तै: _दृष्टिकोण_, _उत्कृष्टता_, _प्रविधिको_) पनि शुद्ध रूपमा प्रस्तुत हुन्छन्।
  ],
)

#v(0.3em)

#figure(
  table(
    columns: (auto, 1.2fr, 2fr),
    inset: 6.5pt,
    align: (center, left, left),
    stroke: (x, y) => if y == 0 { (bottom: 1.5pt + white) } else { 0.5pt + luma(70) },
    fill: (x, y) => if y == 0 { luma(35) } else if calc.even(y) { luma(20) } else { none },
    table.header([*अङ्क*], [*नेपाली उखान / अभिव्यक्ति*], [*तात्पर्य तथा अर्थ*]),
    [१], [नाच्न जान्दैन आँगन टेढो], [आफ्नो कमजोरी ढाकछोप गर्न परिस्थितिलाई दोष दिनु],
    [२], [ढुङ्गाको काप फोरेर पनि उम्रिन्छ पिपल], [दृढ सङ्कल्प र लगनशीलता भए जस्तोसुकै कठिन अवस्थामा पनि सफलता प्राप्त हुन्छ],
    [३], [विद्या धनं सर्वधनं प्रधानम्], [ज्ञान र विद्या नै संसारको सबैभन्दा अमूल्य र श्रेष्ठ सम्पत्ति हो],
  ),
  caption: [नेपाली भाषा तथा देवनागरी लिपिमा आधारित दृष्टान्त तालिका।],
) <tab:nepali>

= 8. Ecosystem and Development Workflow

Typst is supported by a rapidly growing developer ecosystem designed for seamless integration:

- *Typst CLI*: Simple command-line interface (`typst compile`, `typst watch`, and `typst init`).
- *Editor Extensions*: First-class LSP support via *Tinymist* for VS Code, Neovim, and Helix, offering auto-completion, live symbol search, and visual preview.
- *Package Universe*: Curated, community-contributed packages accessible directly via `@preview/` without manual downloads.
- *CI/CD Automation*: GitHub Actions integrate seamlessly to compile and deploy publication-ready PDFs on every commit.

= 9. Conclusion

Typst bridges the long-standing gap between Markdown's simplicity and LaTeX's typographic power. With instant compilation, rich mathematical typesetting, dynamic scripting, and robust internationalization, Typst stands as the next-generation standard for academic and technical communication.

#v(0.2em)

== References

#block(
  fill: luma(18),
  stroke: 0.5pt + luma(50),
  inset: 8pt,
  radius: 3pt,
  width: 100%,
  [
    #set text(size: 8.5pt, fill: luma(200))
    #grid(
      columns: (auto, 1fr),
      gutter: 8pt,
      [\[1\]], [L. Haug and M. Mächler, "Typst: A Programmable Markup-based Typesetting System," 2023.],
      [\[2\]], [D. E. Knuth, _The TeXbook_, Addison-Wesley Professional, Reading, Massachusetts, 1984.],
      [\[3\]], [L. Lamport, _LaTeX: A Document Preparation System_, Addison-Wesley, 2nd Edition, 1994.],
    )
  ]
)
