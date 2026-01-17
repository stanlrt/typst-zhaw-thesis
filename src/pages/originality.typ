#import "../styling/tokens.typ": tokens
#import "../utils.typ": centered, get-pronoun-verb, today
#import "@preview/tieflang:0.1.0": tr

#let declaration-of-originality-page(
  declaration_of_originality: none,
  location: none,
  authors: none,
) = {
  set page(margin: tokens.margin)

  set text(
    size: tokens.font-sizes.body,
    lang: "en",
    region: "gb",
  )
  show: doc => centered(tr().declaration_of_originality, doc)

  if (declaration_of_originality != none) [

    #declaration_of_originality
  ] else [
    #let (pronoun, verb) = get-pronoun-verb(authors)

    #pronoun hereby declare that #lower(pronoun) have written this thesis independently or together with the listed group members. #pronoun have only used the sources and aids (including websites and generative AI tools) specified in the text, in the bibliography or in ai. #pronoun #verb responsible for the quality of the text and the selection of all content and have ensured that information and arguments are substantiated or supported by appropriate scientific sources. Any misconduct will be dealt with according to paragraphs 39 and 40 of the General Academic Regulations for Bachelor's and Master's Degree courses at the Zurich University of Applied Sciences (Rahmenprüfungsordnung ZHAW) and subject to the provisions for disciplinary action stipulated in the university regulations.
  ]

  v(1cm)

  align(left)[
    *#location, #today()*
  ]

  v(0.5cm)

  grid(
    columns: (auto, 4cm),
    column-gutter: 0.4cm,
    row-gutter: 1.2cm,
    ..for author in authors {
      (
        author + ":",
        align(bottom, pad(bottom: -0.2cm, box(
          line(length: 5cm, stroke: 0.8pt),
        ))),
      )
    }
  )
}
