# `modern-zhaw-thesis` template

<a href="https://typst.app/universe/package/modern-zhaw-thesis">
    <img src="https://img.shields.io/badge/dynamic/xml?url=https%3A%2F%2Ftypst.app%2Funiverse%2Fpackage%2Fmodern-zhaw-thesis&query=%2Fhtml%2Fbody%2Fdiv%2Fmain%2Fdiv%5B2%5D%2Faside%2Fsection%5B2%5D%2Fdl%2Fdd%5B3%5D&logo=typst&label=Universe&color=%23239DAE" />
</a>

<br/>
<br/>

`modern-zhaw-thesis` is a comprehensive template for ZHAW academic works (theses, exercises, reports…), adapted from the official branding and following official requirements. It supports both English and German.

[Here’s a showcase](https://github.com/typst/packages/raw/main/packages/preview/modern-zhaw-thesis/0.4.0/showcase.pdf) of how it looks like.

---

This repository holds the template's source code (in [`package/`](package)), the [font files](fonts) you need to install, and the issue tracker.

👉 **Install it here:** [Official package page](https://typst.app/universe/package/modern-zhaw-thesis)

## Development

Requires [Typst](https://typst.app/open-source/) and [just](https://github.com/casey/just).

- `just check`: check that version numbers agree across the package
- `just check-deps`: warn about dependencies with a newer version on Typst Universe
- `just test`: compile the template as a user would get it
- `just assets`: generate `thumbnail.png` and `showcase.pdf`
- `just package @preview`: install the working copy locally (or pass a directory)
- `just release`: publish the version in `package/typst.toml`

To release: bump the version in `package/typst.toml`, the template import, the README and the CHANGELOG, push to `main`, then run `just release`. The release workflow builds the package, pushes it to a branch of [the typst/packages fork](https://github.com/stanlrt/typst-packages-fork) based on the current upstream, opens the pull request (or prints a link to open it) and tags the commit `vX.Y.Z`. To fix something during review, push the fix to `main` and run `just release` again: it updates the open pull request.

---

<img width="400" alt="image" src="https://github.com/user-attachments/assets/02c2bd3d-7f23-422d-ba73-7abf37bee0cf" />
