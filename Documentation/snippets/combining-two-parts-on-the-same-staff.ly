%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.25"

\header {
  lsrtags = "simultaneous-notes, syntax-and-expressions, text"

  texidoc = "
The part combiner tool ( @code{\\partcombine} command ) allows the
combination of several different parts on the same staff.  Text
directions such as @qq{solo} or @qq{a2} are added by default; to remove
them, simply set the property @code{printPartCombineTexts} to @code{f}.
For vocal scores (hymns), there is no need to add @qq{solo/a2} texts,
so they should be switched off.  However, it might be better not to use
it if there are any solos, as they won't be indicated.  In such cases,
standard polyphonic notation may be preferable.

This snippet presents the three ways two parts can be printed on a same
staff: standard polyphony, @code{\\partcombine} without texts, and
@code{\\partcombine} with texts.




"
  doctitle = "Combining two parts on the same staff"
} % begin verbatim


musicUp = \relative c'' {
  \time 4/4
  a4 c4.( g8) a4 |
  g4 e' g,( a8 b) |
  c b a2.
}

musicDown = \relative c'' {
  g4 e4.( d8) c4 |
  r2 g'4( f8 e) |
  d2 \stemDown a
}

\score {
  <<
    <<
    \new Staff {
      \set Staff.instrumentName = #"Standard polyphony"
      << \musicUp \\ \musicDown >>
    }
    \new Staff \with { printPartCombineTexts = ##f } {
      \set Staff.instrumentName = #"PartCombine without texts"
      \partcombine \musicUp \musicDown
    }
    \new Staff {
      \set Staff.instrumentName = #"PartCombine with texts"
      \partcombine \musicUp \musicDown
    }
    >>
  >>
  \layout {
    indent = 6.0\cm
    \context {
      \Score
      \override SystemStartBar.collapse-height = #30
    }
  }
}
