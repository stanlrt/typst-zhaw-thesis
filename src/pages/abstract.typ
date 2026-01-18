#import "../styling/tokens.typ": tokens
#import "../utils.typ": centered, today
#import "@preview/tieflang:0.1.0": tr

#let abstract-page(
  abstract: none,
  keywords: none,
  authors: none,
  title: none,
) = {
  show: doc => centered(tr().abstract, doc)
  show grid.cell.where(x: 0): set text(weight: "bold")

  grid(
    columns: (2cm, 1fr),
    column-gutter: 0.4cm,
    row-gutter: 0.3cm,
    tr().title, title,
    tr().authors, authors.join(", "),
    tr().date, today(),
    tr().institution, tr().institution_name,
  )

  v(0.5cm)
  abstract
  v(0.5cm)

  grid(
    columns: (auto, 1fr),
    column-gutter: 0.4cm,
    row-gutter: 0.3cm,
    tr().keywords, keywords.join(", "),
  )
}
