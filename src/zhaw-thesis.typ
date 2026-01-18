#import "utils.typ": deep-merge
#import "styling/tokens.typ": tokens
#import "pages/title.typ": title-page
#import "pages/abstract.typ": abstract-page
#import "pages/acknowledgements.typ": acknowledgements-page
#import "pages/originality.typ": declaration-of-originality-page
#import "styling/math-and-code.typ": code-styles
#import "styling/glossary.typ": init-glossary, styled-glossary
#import "styling/text.typ": text-styles
#import "styling/figures.typ": figure-styles
#import "styling/table.typ": table-styles
#import "styling/page-header.typ": page-header-styles
#import "styling/page-border.typ": page-border-styles
#import "translations.typ": setup-language

#let zhaw-thesis(
  school: none,
  institute-short: none,
  institute: none,
  work-type: none,
  title: none,
  authors: none,
  supervisors: none,
  study-program: none,
  abstract: none,
  keywords: none,
  acknowledgements: none,
  declaration-of-originality: none,
  location: none,
  page-border: true,
  language: "de",
  glossary-entries: none,
  override: (:),
  bibliography-file: none,
  appendix: none,
  doc,
) = {
  let defaults = (
    title-page: false,
    abstract-page: false,
    declaration-page: false,
    acknowledgements-page: false,
  )
  let override = deep-merge(defaults, override)


  set enum(numbering: "1.i.1.i.")

  show: setup-language.with(language)
  show: init-glossary.with(glossary-entries, term-links: true)


  show outline.entry.where(
    level: 1,
  ): it => {
    set block(above: 0.5cm)
    set text(font: tokens.font-families.headers, weight: "bold")
    it
  }
  show: text-styles
  show: page-header-styles
  show: figure-styles
  show: table-styles
  show: code-styles
  show ref: set text(fill: tokens.colour.main)
  show link: set text(fill: tokens.colour.main)
  show: page-border-styles.with(page-border) // Keep after table styles!!

  // context is neeeded for the tr() calls inside the page functions
  context {
    if (override.title-page == false) {
      title-page(
        school: school,
        institute: institute,
        work_type: work-type,
        title: title,
        authors: authors,
        supervisors: supervisors,
      )
    } else {
      override.title-page
    }

    set page(numbering: "i")
    counter(page).update(1)

    if (override.abstract-page == false) {
      abstract-page(
        abstract: abstract,
        keywords: keywords,
        authors: authors,
        title: title,
      )
    } else {
      override.abstract-page
    }

    if (override.acknowledgements-page == false) {
      acknowledgements-page(
        acknowledgements: acknowledgements,
        supervisors: supervisors,
        authors: authors,
      )
    } else {
      override.acknowledgements-page
    }

    if (override.declaration-page == false) {
      declaration-of-originality-page(
        declaration_of_originality: declaration-of-originality,
        location: location,
        authors: authors,
      )
    } else {
      override.declaration-page
    }

    outline(title: "Table of Contents", depth: 3)

    set page(numbering: "1")
    counter(page).update(1)

    doc

    styled-glossary

    bibliography(
      bibliography-file,
      style: "institute-of-electrical-and-electronics-engineers",
    )

    if appendix != none {
      set heading(numbering: none, supplement: [Appendix])
      counter(heading).update(1)

      [= Appendix<appendix>]

      set heading(numbering: "1.1.1")

      appendix
    }
  }
}


#import "@preview/colorful-boxes:1.4.3": *

#let coloured-box(title, text) = colorbox(
  title: title,
  color: (
    fill: tokens.colour.lightest,
    stroke: tokens.colour.main,
    title: tokens.colour.main,
  ),
  radius: tokens.radius,
  width: auto,
  inset: 10pt,
)[
  #text
]
