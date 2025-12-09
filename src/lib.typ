#import "@preview/glossy:0.7.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#let school = "Engineering"
#let institue_short = "IniT"
#let institute = "Computer Science"
#let research_group = "Software Engineering"
#let work_type = "Bachelor project"
#let title = "LLM agents for functional suitability testing of vibe-coded web-apps"
#let authors = ("Stanislas Laurent", "Jonathan Durner")
#let supervisors = ("Prof. Dr. Marcela Ruiz",)
#let study_program = "Computer Science B.Sc."
#let abstract = "TODO"
#let keywords = ("TODO", "TODO")
#let acknowledgements = "We sincerely thank Prof. Dr. Marcela Ruiz for her expertise in requirements engineering and no-code solutions. Her guidance and support was invaluable to the successful completion of this project.
"
#let declaration_of_originality = ""
#let location = "Zürich"
#let page_boder = true

// See https://github.com/typst/typst/issues/2953
#let show_if_heading_within_distance(
  it: none,
  distance: 1cm,
  look: "before",
  to-show: v(-1cm),
  if-not: false
) = {
  if it == none { 
    panic("Parameter \"it\" of \"show_if_neighbour_within_distance\" must be defined.")
  }

  // 1. Find neighbouring headings
  let sel = selector(heading)
  let neighbours = ()

  if look == "before" {
    neighbours = query(sel.before(here(), inclusive: false))
  } else if look == "after" {
    neighbours = query(sel.after(here(), inclusive: false))
  } else {
    panic("Parameter \"look\" of \"show_if_neighbour_within_distance\" must have value \"before\" or \"after\".")
  }

  if neighbours.len() > 0 {
    // 2. Get the closest heading (last 'before' or first 'after').
    let neighbour = if look == "before" {
      neighbours.last()
    } else {
      neighbours.first()
    }

    // 3. Get the absolute positions of the current element and the neighbour.
    let iloc = it.location().position()
    let nloc = neighbour.location().position()

    // 4. Check if distance is within threshold
    if iloc.page == nloc.page and iloc.x == nloc.x {
      let vertical-distance = if look == "before" {
        iloc.y - nloc.y
      } else {
        nloc.y - iloc.y
      }
      
      if vertical-distance < distance {
        if(if-not) { return none } 
        return to-show
      }
    }
  }

  if(if-not) { return to-show } 
  return none
}

#let tokens = (
  colour: (
    "main": rgb("#0064A6"),
    "light": rgb("#8FC8EE"),
    "lightest": rgb("#deeef8"),
  ),
  font-sizes: (
    "h1": 32pt,
    "body": 11pt
  ),
  margin: 2.5cm,
  radius: 4pt,
)

#let layout-thesis(doc) = {
  let blue_frame;

  if(page_boder) {
    blue_frame = rect(
        width: 100%, 
        height: 100%, 
        stroke: (
          paint: blue, 
          thickness: 16pt, 
          cap: "round"
        ),
      )
  }
  
  set page(paper: "a4", margin: tokens.margin, background: blue_frame)

  set enum(numbering: "1.i.1.i.")

  set text(
    font: "Helvetica Neue", 
    size: tokens.font-sizes.body,
    lang: "en", //TODO LANG DE/EN
    region: "gb"
  ) 
  
  // ----------------------------------------------------------------
  // Body text
  // ----------------------------------------------------------------

  set par(
    spacing: 1.4em,
    leading: 0.7em,
    justify: true, 
    linebreaks: "optimized"
  )

  // ----------------------------------------------------------------
  // Headings
  // ----------------------------------------------------------------
  
  set heading(numbering: "1.1.1")

  let bottom_padding = 0.4cm

  show heading: it => {
    set text(font: "Arial Rounded MT", fill: tokens.colour.main)
    let level_based_spacing = (1.4/it.level)
    
    // Reduce spacing between 2 consecutive headings
    show_if_heading_within_distance(
        it: it,
        distance: 2*bottom_padding + 1cm,
        look: "before",
        to-show: v(-2*level_based_spacing*bottom_padding),
    )

    v(bottom_padding*level_based_spacing)
    it
    v(bottom_padding*level_based_spacing - 0.05cm)
  }
  
  show heading.where(level: 1): it => {
    set text(font: "Arial Rounded MT")
    if it.numbering == none {
      pagebreak()
      text(fill: tokens.colour.main, size: tokens.font-sizes.h1, it)
      v(bottom_padding)
    } else {
      set par(justify: false)
      let heading_number = counter(heading.where(level: 1)).display()
  
      pagebreak()
      grid(
        columns: (3cm, 1fr),
        rows: (3cm),
        gutter: -0.8cm,
        place(dx: -0.5em, text(fill: tokens.colour.main, size: 96pt, heading_number)),
        text(fill: tokens.colour.main, size: tokens.font-sizes.h1, it.body)
      )
      show_if_heading_within_distance(
        it: it,
        distance: 10cm,
        look: "after",
        to-show: v(1cm),
        if-not: true
      )
    }
  }

  show heading.where(level: 4): it => {
    set text(weight: "regular")
    it
  }

  // ----------------------------------------------------------------
  // Outline
  // ----------------------------------------------------------------

  show outline.entry.where(
    level: 1
  ): it => {
    set block(above: 0.5cm)
    set text(font: "Arial Rounded MT", size: 12pt)
    it
  }

  // ----------------------------------------------------------------
  // Page header
  // ----------------------------------------------------------------

  let fill-line(left-text, right-text) = {
    set par(
    first-line-indent: (
      amount: 0em,
    ),
  )
    
    [#left-text #h(1fr) #right-text]
  }

  set page(
    header-ascent: 30%, header: context{
      let page-number = here().page()

      // If the current page is the start of a chapter, don't show a header
      let target = heading.where(level: 1)
      if query(target).any(it => it.location().page() == page-number) {
        return []
      }

      // Find the chapter of the section we are currently in.
      let before = query(target.before(here()))
      if before.len() > 0 {
        let current = before.last()

        let chapter-title = current.body
        let chapter-number = counter(heading.where(level: 1)).display()
        let chapter-number-text = [Chapter #chapter-number]

        if current.numbering != none {
          let (left-text, right-text) = if calc.odd(page-number) {
            (chapter-number-text, chapter-title)
          } else {
            (chapter-title, chapter-number-text)
          }
          text(weight: "regular", font: "Arial Rounded MT", fill-line(left-text, right-text))
          v(-bottom_padding)
          line(length: 100%, stroke: 0.5pt)
           
        }
      }
    },
  )

  // ----------------------------------------------------------------
  // Maths and code
  // ----------------------------------------------------------------

  set math.equation(numbering: "(1)")
  show math.equation: set text(font: "Fira Math")
  show raw: set text(font: "Fira Code") //Code blocks

  // ----------------------------------------------------------------
  // Refs & links
  // ----------------------------------------------------------------

  show ref: set text(fill: tokens.colour.main)
  show link: set text(fill: tokens.colour.main)

  // ----------------------------------------------------------------
  // Figures, listings & captions
  // ----------------------------------------------------------------

  let fig_padding = 0.6cm

  show figure: fig => {
    v(fig_padding)
    fig
  }
  
  show figure.caption: caption => {
        set text(style: "italic")
        v(0.4cm)
        text(style: "normal", weight: "bold", caption.supplement + " " + caption.counter.display() + ": ")
        caption.body
        v(fig_padding)
  }

  show figure.where(kind: raw): set figure(supplement: [Code Snippet])
  show figure.where(kind: table): set figure(supplement: [Table])

  // ----------------------------------------------------------------
  // Tables & grids
  // ----------------------------------------------------------------

  show table.cell.where(y: 0): strong
  set table(
    fill: (_, y) => if y == 0 { tokens.colour.main } else { tokens.colour.lightest }, 
    stroke: none,
    gutter: 0.08cm,
    align: horizon+left,
    inset: (x: 8pt, y: 10pt),
  )
  show table.cell.where(y: 0): c => {
   text(fill: white, font: "Arial Rounded MT", size: tokens.font-sizes.body - 1.4pt, c)
  }
  
  show table.cell: c => { 
    set par(justify: false)
    set text(size: tokens.font-sizes.body - 1pt)
    c
  }

  show table: t => {
    block(
      clip: true,
      radius: tokens.radius,
      t
    )
  }

  // Return the document content
  doc
}


// ----------------------------------------------------------------
// Glossary
// ----------------------------------------------------------------

#let my-theme = (
  section: (title, body) => {
    heading(level: 1)[#title]
    body
  },
  group: (name, index, total, body) => {
    if name != "" and total > 1 {
      heading(level: 2)[#name]
    }
    body
  },
  entry: (entry, index, total) => {
    let label = text(weight: "bold")[
      #entry.short#entry.label
      #if entry.long != none {
        " (" + entry.long + ")"
      }
    ]
    let description = entry.description
    
    block(breakable: false)[
      #grid(
        columns: (auto, 1fr, auto),
        label,
        h(1fr),
        entry.pages,
      )
      #v(-0.1cm)
      #description
      #v(0.1cm)
    ]
  },
)

#let styled-glossary = { glossary(theme: my-theme) }

#let styled-code = { 
  codly(
    languages: codly-languages, 
    fill: rgb("#fafafa"),
    aliases: ("typescript": "ts")
  ) 
}

// ----------------------------------------------------------------
// Coloured box
// ----------------------------------------------------------------

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
  inset: 10pt
  
)[
  #text
]
