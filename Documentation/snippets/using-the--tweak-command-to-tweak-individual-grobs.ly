%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.20"

\header {
  lsrtags = "really-simple, tweaks-and-overrides"

  texidoc = "
With the @code{\\tweak} command, every grob can be tuned directly.
Here are some examples of available tweaks.

"
  doctitle = "Using the \\tweak command to tweak individual grobs"
} % begin verbatim


\relative c' {
  \time 2/4
  \set fingeringOrientations = #'(right)
  <
    \tweak font-size #3 c
    \tweak color #red d-\tweak font-size #8 -4
    \tweak style #'cross g
    \tweak duration-log #2 a
  >2
}
