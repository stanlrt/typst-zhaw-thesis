#import "../styling/tokens.typ": tokens
#import "../utils.typ": centered, get-pronoun-verb

#let acknowledgements-page(
  acknowledgements: none,
  supervisors: none,
  authors: none,
) = {
  let supervisors = supervisors.join(", ", last: " and ")
  show: doc => centered("Acknowledgements", doc)

  if acknowledgements != none [

    #acknowledgements
  ] else [

    #get-pronoun-verb(authors).pronoun sincerely thank #supervisors for their expertise and continuous advice. Their guidance and support was invaluable to the successful completion of this project.
  ]
}
