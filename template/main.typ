#import "../src/lib.typ": *

#let paGlossary = (
  "deployment": (
    long: "deploy",
    short: "deployment",
    description: [Software deployment encompasses all the activities that make a software system available for use, including installation, configuration, running, testing, and making necessary adjustments. Think of deployment as the bridge between your development team and your users.],
    group: "Terms",
  ),
  "ISO": (
    short: "ISO",
    long: "International Organisation for Standardisation",
    description: [ISO is an independent, non-governmental international organisation. It brings global experts together to agree on the best ways of doing things. From quality management to AI, our mission is to make lives easier, safer and better – for everyone, everywhere.],
    group: "Acronyms",
  ),
)

#show: zhaw-thesis.with(
  language: "de",
  glossary-entries: paGlossary,
  //   override: (
  //     title-page: none,
  //   ),
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
