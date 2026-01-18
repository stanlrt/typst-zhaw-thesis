#import "../src/lib.typ": *
#import "glossary.typ": myGlossary

#show: zhaw-thesis.with(
  language: "de",
  school: "Engineering",
  institute-short: "IniT",
  institute: "Computer Science",
  work-type: "Bachelor project",
  title: "Title",
  authors: ("Alice", "Bob"),
  supervisors: ("Prof. Dr. Charlie", "Dr. David"),
  study-program: "Computer Science B.Sc.",
  abstract: lorem(40),
  keywords: ("computer", "software"),
  location: "Zürich",
  glossary-entries: myGlossary,
  bibliography-file: "/template/biblio.bib",
  appendix: [#include "appendix.typ"],
  override: (
    abstract-page: "jdjdjjd",
  ),
)

= Introduction

#lorem(40) @deployment @ISO

#figure(
  ```typescript
  function fibonacci(n: number) {
    if (n <= 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
  ```,
  caption: "Example of a TypeScript function computing Fibonacci numbers",
)

#coloured-box(
  "Conclusion",
)[Lirili larila]

$
  x times y = z
$

@xu_first_2024

#figure(
  table(
    columns: (auto, auto, auto, 4cm),
    // Header
    [Tool], [Primary focus (as documented)], [Functional testing feature], [Sources],
    // Rows
    [Lovable, Bolt, Cursor],
    [Code Generation, Security Audits],
    [*Absent*; Users directed to manual, traditional methods.],
    [],

    [VibeEval],
    [Security Test Generation (using  agents)],
    [*Absent*; Focus restricted to security tests executed via Playwright.],
    [,],

    [Vibecode, Rork],
    [Mobile Web App Generation],
    [*Absent*; No mention of functional suitability testing despite high usability needs.],
    [No source mentions usability testing],
  ),
  caption: "Results of the systematic review of integrated solutions",
)

== Context and motivation

#lorem(40)

== Problem statement

#lorem(40)

=== Test 3

==== Test 4

#lorem(40)

===== Test 5

= Test 2

Lala
