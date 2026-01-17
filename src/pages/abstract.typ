#import "../styling/tokens.typ": tokens
#import "../utils.typ": centered, today

#let abstract-page(
  abstract: none,
  keywords: (),
  authors: (),
  title: none,
) = {
  set page(margin: tokens.margin)

  set text(
    size: tokens.font-sizes.body,
    lang: "en",
    region: "gb",
  )

  set par(leading: 1.5em, first-line-indent: 0pt, justify: true)
  show: doc => centered("Abstract", doc)
  show grid.cell.where(x: 0): set text(weight: "bold")

  grid(
    columns: (2cm, 1fr),
    column-gutter: 0.4cm,
    row-gutter: 0.3cm,
    "Title", title,
    "Authors", authors.join(", "),
    "Date", today(),
    "Institution", "ZHAW University of Applied Sciences",
  )

  v(0.5cm)
  abstract
  v(0.5cm)

  grid(
    columns: (2cm, 1fr),
    column-gutter: 0.4cm,
    row-gutter: 0.3cm,
    "Keywords", keywords.join(", "),
  )
}
