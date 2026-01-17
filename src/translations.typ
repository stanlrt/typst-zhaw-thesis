#import "@preview/tieflang:0.1.0": configure-translations, push-lang

#let translations = (
  de: (
    pronoun: (
      we: [wir],
      i: [ich],
    ),
    abstract: [Zusammenfassung],
    title: [Titel],
    author: [Autor],
    authors: [Autoren],
    supervisor: [Betreuer],
    supervisors: [Betreuer],
    acknowledgements: [Danksagungen],
    declaration_of_originality: [Eidesstattliche Erklärung],
    location: [Ort],
    date: [Datum],
    institution: [Institution],
    keywords: [Schlüsselwörter],
    submitted_on: [Eingereicht am],
    school_of: [School of],
    insitute_of: [Institut für],
    table_of_contents: [Inhaltsverzeichnis],
    glossary: [Glossar],
    code_snippet: [Code-Snippet],
    chapter: [Kapitel],
    appendix: [Anhang],
  ),
  en: (
    pronoun: (
      we: [we],
      i: [I],
    ),
    abstract: [Abstract],
    title: [Title],
    author: [Author],
    authors: [Authors],
    supervisor: [Supervisor],
    supervisors: [Supervisors],
    acknowledgements: [Acknowledgements],
    declaration_of_originality: [Declaration of Originality],
    location: [Location],
    date: [Date],
    institution: [Institution],
    keywords: [Keywords],
    submitted_on: [Submitted on],
    school_of: [School of],
    insitute_of: [Institute of],
    table_of_contents: [Table of Contents],
    glossary: [Glossary],
    code_snippet: [Code Snippet],
    chapter: [Chapter],
    appendix: [Appendix],
  ),
)

#let languages = (
  de: "de",
  en: "en",
)

#let setup-language(lang, doc) = {
  configure-translations(translations)
  push-lang(lang)

  set text(
    lang: lang,
    region: if lang == "en" { "gb" } else { "ch" },
  )

  doc
}
