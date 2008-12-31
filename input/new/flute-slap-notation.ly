\version "2.12.0"

\header {
  lsrtags = "winds"

  texidoc = "
It is possible to indicate special articulation techniques such as
flute's \"tongue slap\", by replacing the note head with the
appropriate glyph.

"
  doctitle = "Flute slap notation"
}

slap =
#(define-music-function (parser location music) (ly:music?)
#{
  \override NoteHead #'stencil = #(lambda (grob)
    (grob-interpret-markup grob
      (markup #:musicglyph "scripts.sforzato")))
  \override NoteHead #'extra-offset = #'(0.1 . 0.0)
  $music
  \revert NoteHead #'stencil
  \revert NoteHead #'extra-offset
#})

\relative c' {
  c4 \slap c d r \slap { g a } b r
}
