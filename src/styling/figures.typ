#let figure-styles(doc) = {
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

  doc
}
