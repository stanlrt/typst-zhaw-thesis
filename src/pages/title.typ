#import "../utils.typ": *
#import "../styling/tokens.typ": tokens
#import "@preview/tieflang:0.1.0": tr

#let title-page(
  school: none,
  institute-short: none,
  institute: none,
  work_type: none,
  title: none,
  authors: none,
  supervisors: none,
) = {
  set page(fill: tokens.colour.main, margin: 1cm, background: none)
  set par(leading: 0.8em)
  set text(fill: white, weight: "bold", font: tokens.font-families.headers)

  let logo = (
    image("../assets/zhaw_logo.png"),
    pad(right: 30%, top: 18pt, text(
      size: 18pt,
      tr().school_of + " " + school + linebreak() + tr().insitute_of + " " + institute,
    )),
  )

  let optical_alignment = 8pt

  let title = align(horizon, block(inset: (left: optical_alignment))[
    #pad(bottom: -1.2em, upper(text(size: 16pt, weight: "regular", font: tokens.font-families.body, work_type)))
    #linebreak()
    #par(leading: 2em, justify: false, first-line-indent: 0pt, text(size: 32pt, title))
  ])

  let info() = {
    set par(justify: false)
    grid(
      columns: (25%, 25%, 25%),
      rows: (auto, 1cm),
      column-gutter: 1cm,
      inset: (left: optical_alignment),
      block[
        #tr().authors:\
        #text(font: tokens.font-families.body, weight: "regular", authors.join(linebreak()))
      ],
      align(start + top)[
        #tr().supervisors:\
        #text(font: tokens.font-families.body, weight: "regular", supervisors.join(linebreak())) \
      ],
      align(start + top)[
        #tr().submitted_on:\
        #text(font: tokens.font-families.body, weight: "regular", today())
      ],
    )
  }

  grid(
    columns: (3cm, 1fr),
    rows: (3cm, 1fr, auto),
    gutter: 0.5cm,
    ..logo,
    "",
    title,
    "",
    info(),
  )
}
