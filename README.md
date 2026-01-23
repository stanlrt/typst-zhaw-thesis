# The `zhaw-thesis` Package
<div align="center">Version 0.1.0</div>

An unofficial template for ZHAW academic works, adaped from the official branding.

## Setup

### Web-app (easiest)

1. Create a project from https://typst.app/universe/package/zhaw-thesis
2. Download the font files in the repo's font directory.
3. Drag and drop the files into the webapp's file panel on the left (you can create a font folder)

### Local

1. Install Typst from https://typst.app/open-source/
3. Download the font files ftom this repo's font directory and make them accessible to the compiler (https://typst.app/docs/reference/text/text/#parameters-font)
4. Run `typst init @preview/zhaw-thesis:0.1.0` in your project directory

## Configuration

Below is the complete list of configuration options, inclueing default values and explanations. Most are optional.

```typ
#import "@preview/zhaw-thesis:0.1.0": *
#import "glossary.typ": myGlossary

#show: zhaw-thesis.with(
  language: languages.de,         // Document language 
  cover: (                       
    school: none,                 // E.g., "School of Engineering" REQUIRED
    institute: none,              // E.g., "Computer Science" REQUIRED
    work-type: none,              // E.g., "Bachelor Thesis" REQUIRED
    title: none,                  // Work's title REQUIRED
    authors: none,                // Author name(s), e.g. ("Max Mustermann", "Erika Musterfrau") REQUIRED
    supervisors: none,            // Supervisor name(s), e.g. ("Prof. Dr. John Doe", "Dr. Jane Doe")
    study-program: none,          // E.g., "Computer Science BSc"
    override: none,               // Override cover page with your own file, e.g. [#include: "my-cover.typ"]
  ),
  abstract: (
    keywords: none,               // List of keywords, e.g. ("Typst", "ZHAW", "Thesis Template") REQUIRED
    en: none,                     // English abstract text
    de: none,                     // German abstract text. REQUIRED by ZHAW even when language is English.
    override: none,               // Override abstract page with your own file, e.g. [#include: "my-abstract.typ"]
  ),
  acknowledgements: (
    text: none,                   // Custom acknowledgements text
    override: none,               // Override acknowledgements page with your own file, e.g. [#include: "my-acknowledgements.typ"]
  ),
  declaration-of-originality: (
    location: none,               // E.g., "Zurich" REQUIRED
    text: none,                   // Custom declaration text
    override: none,               // Override declaration page with your own file, e.g. [#include: "my-declaration.typ"]
  ),
  glossary-entries: none,         // Variable containing glossary entries, e.g., myGlossary
  biblio: (
    file-path: none,              // Path to your .bib file, e.g., "references.bib"
    style: "ieee",                // Bibliography style, e.g., "ieee", "apa", etc.
  ),
  appendix: none,                 // Content for the appendix, e.g., [#include: "appendix.typ"]
  page-border: true,              // Enable/disable page border
)
```

## Template adaptation checklist

- [ ] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [ ] Check and/or replace `LICENSE` by something that suits your needs
- [ ] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
- [ ] Adapt Repository URLs in `CHANGELOG.md`
  - Consider only committing that file with your first release, or removing the "Initial Release" part in the beginning
- [ ] Adapt or deactivate the release workflow in `.github/workflows/release.yml`
  - to deactivate it, delete that file or remove/comment out lines 2-4 (`on:` and following)
  - to use the workflow
    - [ ] check the values under `env:`, particularly `REGISTRY_REPO`
    - [ ] if you don't have one, [create a fine-grained personal access token](https://github.com/settings/tokens?type=beta) with [only Contents permission](https://stackoverflow.com/a/75116350/371191) for the `REGISTRY_REPO`
    - [ ] on this repo, create a secret `REGISTRY_TOKEN` (at `https://github.com/[user]/[repo]/settings/secrets/actions`) that contains the so created token

    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] remove/replace the example test case
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README
