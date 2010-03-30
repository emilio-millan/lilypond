%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "editorial-annotations"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  texidoces = "
Se puede cambiar el aspecto de las líneas de rejilla
sobreescribiendo algunas de sus propiedades.

"
  doctitlees = "Líneas de rejilla: modificar su aspecto"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Die Erscheinung der Gitternetzlinien kann durch einige Eigenschaften
geändert werden.

"
  doctitlede = "Gitternetzlinien: Aussehen verändern"
%% Translation of GIT committish: 9ccf7f0f5e52e074f3b7852416ad5b78718395c8
  texidocfr = "
Modifier certaines des propriétés du cadrillage temporel aura pour effet
d'en changer l'apparence.

"
  doctitlefr = "Apparence du cadrillage temporel"


  texidoc = "
The appearance of grid lines can be changed by overriding some of their
properties.

"
  doctitle = "Grid lines: changing their appearance"
} % begin verbatim

\score {
  \new ChoirStaff <<
    \new Staff {
      \relative c'' {
        \stemUp
        c'4. d8 e8 f g4
      }
    }
    \new Staff {
      \relative c {
        % this moves them up one staff space from the default position
        \override Score.GridLine #'extra-offset = #'(0.0 . 1.0)
        \stemDown
        \clef bass
        \once \override Score.GridLine #'thickness = #5.0
        c4
        \once \override Score.GridLine #'thickness = #1.0
        g'4
        \once \override Score.GridLine #'thickness = #3.0
        f4
        \once \override Score.GridLine #'thickness = #5.0
        e4
      }
    }
  >>
  \layout {
    \context {
      \Staff
      % set up grids
      \consists "Grid_point_engraver"
      % set the grid interval to one quarter note
      gridInterval = #(ly:make-moment 1 4)
    }
    \context {
      \Score
      \consists "Grid_line_span_engraver"
      % this moves them to the right half a staff space
      \override NoteColumn #'X-offset = #-0.5
    }
  }
}

