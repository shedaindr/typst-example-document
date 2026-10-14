// Document setup and page layout - Dark Mode (Black & White)
#set page(
  paper: "a4",
  fill: black,
  margin: (x: 2.5cm, top: 2.5cm, bottom: 2.5cm),
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

// Global typography and paragraph rules (with Devanagari / Nepali font fallback)
#set text(
  font: ("Times New Roman", "Nirmala UI", "Mangal"),
  size: 11pt,
  fill: white,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.7em,
)

// Clean white underlined links
#show link: it => underline(text(fill: white)[#it])

// Enable equation numbering for numbered math formulas
#set math.equation(numbering: "(1)")

// Headings in bold white
#show heading.where(level: 1): it => block(below: 1em)[
  #v(0.8em)
  #text(fill: white, weight: "bold", size: 14pt)[#it.body]
]

#show heading.where(level: 2): it => block(below: 0.8em)[
  #v(0.5em)
  #text(fill: luma(220), weight: "bold", size: 12pt)[#it.body]
]

// Document Header / Title
#align(center)[
  #text(22pt, weight: "bold", fill: white)[Introduction to Typst] \
  #v(0.3em)
  #text(12pt, fill: luma(200), style: "italic")[A modern, expressive, and blazing-fast typesetting system] \
  #v(1em)

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
  
  #v(0.8em)
  #text(10pt, fill: luma(180))[#datetime.today().display("[month repr:long] [day], [year]")]
]

#v(1em)

// Abstract block (Dark Mode)
#align(center)[
  #block(
    width: 90%,
    stroke: (left: 3pt + white, rest: 0.5pt + luma(60)),
    inset: (x: 12pt, y: 10pt),
    fill: luma(25),
    radius: (right: 3pt),
    align(left)[
      #text(weight: "bold", fill: white)[Abstract] --- 
      This document serves as a clean, idiomatic example of a document authored in *Typst*. It demonstrates page setup, typography, mathematical formulas, formatted tables, code listings, multilingual support (including Nepali), callout admonitions, and cross-referencing in a dark mode aesthetic.
    ],
  )
]

#v(1em)

= 1. Introduction

Typst is a markup-based typesetting system designed to be as powerful as LaTeX while offering a much simpler, more intuitive user experience. Unlike legacy tools, Typst compiles in milliseconds, offers helpful compile-time diagnostics, and features a clean syntax inspired by Markdown.

== Key Advantages

- *Instant Compilation*: Incremental compilation provides real-time PDF feedback as you type.
- *Consistent Syntax*: Markup, math, and scripting share a cohesive, predictable design.
- *Modern Layout Engine*: Built-in support for flexible grids, borders, and modern typography.

Formatting text is straightforward:
- *Bold text* is written with `*bold*`
- _Italic text_ is written with `_italic_`
- `Monospace text` is written with backticks
- Lists can be unordered (`- bullet`) or numbered (`+ item`):
  + First ordered step
  + Second ordered step
    - Nested bullet point
    - Additional detail
  + Final conclusion step

= 2. Mathematical Typesetting

Math formulas in Typst are enclosed in dollar signs (`$`). 

Inline equations sit comfortably within text: $E = m c^2$ or $sum_(i=1)^n i = (n(n+1)) / 2$.

Block equations are created by inserting spaces or linebreaks inside `$ ... $`:

$
  f(x) = 1 / (sigma sqrt(2 pi)) e^(- 1/2 ((x - mu) / sigma)^2)
$ <eq:gaussian>

We can easily cross-reference this Gaussian distribution via @eq:gaussian.

Typst also handles matrices, derivatives, integrals, and limits with clean syntax:

$
  bold(M) = mat(
    cos(theta), -sin(theta);
    sin(theta),  cos(theta);
  )
$

$
  lim_(x -> 0) (sin(x)) / x = 1, quad integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2
$

= 3. Tables and Figures

Tables can be structured with `#table` and wrapped in `#figure` to provide automatic captions and numbering:

#figure(
  table(
    columns: (auto, 1.5fr, 1fr),
    inset: 8pt,
    align: (left, left, center),
    stroke: (x, y) => if y == 0 { (bottom: 1.5pt + white) } else { 0.5pt + luma(70) },
    fill: (x, y) => if y == 0 { luma(35) } else if calc.even(y) { luma(20) } else { none },
    table.header([*Aspect*], [*Typst*], [*LaTeX*]),
    [Syntax], [Intuitive, Markdown-like], [Complex macro-heavy],
    [Speed], [Milliseconds], [Multi-pass, slower],
    [Error diagnostics], [Precise with line snippets], [Cryptic errors],
    [Package ecosystem], [Integrated packages (`@preview`)], [CTAN / TeX Live],
  ),
  caption: [Comparison between Typst and traditional LaTeX workflows.],
) <tab:comparison>

As shown in @tab:comparison, Typst simplifies modern publishing workflows without sacrificing output quality.

= 4. Code Listings

Syntax highlighting works cleanly on dark backgrounds:

#show raw.where(block: true): it => block(
  fill: luma(22),
  inset: 10pt,
  radius: 4pt,
  stroke: 0.5pt + luma(60),
  width: 100%,
  it,
)

```python
def compute_fibonacci(limit: int) -> list[int]:
    """Generate Fibonacci sequence up to limit items."""
    fib = [0, 1]
    while len(fib) < limit:
        fib.append(fib[-1] + fib[-2])
    return fib

print(compute_fibonacci(8))
```

= 5. Custom Admonition Component

Typst allows you to write functions that encapsulate reusable UI components:

#let callout(title: "Note", body) = block(
  width: 100%,
  stroke: (left: 3.5pt + white, rest: 0.5pt + luma(70)),
  fill: luma(25),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  [
    #text(weight: "bold", fill: white)[#title] \
    #v(0.2em)
    #body
  ],
)

#callout(title: "Helpful Tip")[
  Run `typst watch example.typ` in your terminal to enable automatic live preview in your favorite PDF reader.
]

= 6. नेपाली भाषा समर्थन (Nepali Language Support)

टाइपस्ट (Typst) ले युनिकोड (Unicode) र देवनागरी लिपिलाई पूर्ण रूपमा समर्थन गर्दछ। सही फन्ट (जस्तै _Nirmala UI_ वा _Mangal_) को प्रयोग गर्दा नेपाली पाठहरू स्पष्ट र सुन्दर रूपमा प्रस्तुत हुन्छन्।

#block(
  width: 100%,
  stroke: (left: 3.5pt + white, rest: 0.5pt + luma(70)),
  fill: luma(25),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  [
    #text(weight: "bold", fill: white)[नेपाली सारांश:] \
    #v(0.2em)
    टाइपस्ट एक आधुनिक, तीव्र र शक्तिशाली कागजात ढाँचा (typesetting) प्रणाली हो। यसले अनुसन्धान पत्र, प्रतिवेदन तथा प्राविधिक लेखहरू तयार गर्न निकै सहज वातावरण प्रदान गर्दछ।
  ],
)

= 7. Conclusion

With its lightweight syntax, instant compilation, rich multilingual capabilities, and modern programmatic flexibility, Typst is an excellent choice for research papers, homework assignments, resumes, and technical documentation.
