%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.6"

\header {
  lsrtags = "expressive-marks"

  texidoc = "
The glyph of the breath mark can be tuned by overriding the @code{text}
property of the @code{BreathingSign} layout object with any markup
text.

"
  doctitle = "Changing the breath mark symbol"
} % begin verbatim

\relative c'' {
  c2
  \override BreathingSign.text =
    \markup { \musicglyph #"scripts.rvarcomma" }
  \breathe
  d2
}
