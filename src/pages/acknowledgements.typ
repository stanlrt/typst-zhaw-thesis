#import "../styling/tokens.typ": tokens
#import "../utils.typ": centered
#import "@preview/tieflang:0.1.0": tr

#let acknowledgements-page(
  acknowledgements: none,
  supervisors: none,
  authors: none,
) = {
  let supervisors = supervisors.join(", ", last: " " + tr().and + " ")
  show: doc => centered(tr().acknowledgements.title, doc)

  if acknowledgements != none [

    #acknowledgements
  ] else [
    #let plural = authors.len() > 1

    #(tr().acknowledgements.text)(plural, supervisors)
  ]
}
