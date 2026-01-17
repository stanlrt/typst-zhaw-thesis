#import "styling/tokens.typ": tokens

// See https://github.com/typst/typst/issues/2953
#let show_if_heading_within_distance(
  it: none,
  distance: 1cm,
  look: "before",
  to-show: v(-1cm),
  if-not: false,
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
        if (if-not) { return none }
        return to-show
      }
    }
  }

  if (if-not) { return to-show }
  return none
}

#let today() = {
  let current-date = datetime.today()
  current-date.display("[day padding:none] [month repr:long] [year]")
}

#let centered(title, content) = {
  pagebreak()
  set align(center + horizon)
  set par(first-line-indent: 0cm)
  align(start + horizon)[
    #text(font: tokens.font-families.headers, fill: tokens.colour.main, weight: "bold", size: 24pt, title)
    #content
  ]
}

#let get-pronoun-verb(subjects) = {
  let pronoun = "I"
  let verb = "am"

  if (subjects.len() > 1) {
    pronoun = "We"
    verb = "are"
  }

  return (pronoun: pronoun, verb: verb)
}
