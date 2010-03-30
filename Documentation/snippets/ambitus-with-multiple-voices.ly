%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
  lsrtags = "pitches, vocal-music"

%% Translation of GIT committish: 1d589aa04c20d7711bf662618adbdd6d445db29d
  doctitlees = "Ámbitos con varias voces"
  texidoces = "
La adición del grabador @code{Ambitus_engraver} al contexto de
@code{Staff} crea un solo ámbito por pentagrama, incluso en el caso de
pentagramas con varias voces.

"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Indem man den @code{Ambitus_engraver} im @code{Staff}-Kontext
hinzufügt, erhält man einen einzigen Ambitus pro System, auch in dem
Fall, dass mehrere Stimmen sich im gleichen System befinden.
"
  doctitlede = "Ambitus mit vielen Stimmen"
%% Translation of GIT committish: 58a29969da425eaf424946f4119e601545fb7a7e
  texidocfr = "
Si plusieurs voix se trouvent sur une même portée, on peut attribuer le
graveur @code{Ambitus_engraver} au contexte @code{Staff} afin d'obtenir
l'ambitus de toutes les voix cumulées, non d'une seule des voix actives. 

"
  doctitlefr = "Ambitus sur plusieurs voix"


  texidoc = "
Adding the @code{Ambitus_engraver} to the @code{Staff} context creates
a single ambitus per staff, even in the case of staves with multiple
voices.

"
  doctitle = "Ambitus with multiple voices"
} % begin verbatim

\new Staff \with {
  \consists "Ambitus_engraver"
  }
<<
  \new Voice \relative c'' {
    \voiceOne
    c4 a d e
    f1
  }
  \new Voice \relative c' {
    \voiceTwo
    es4 f g as
    b1
  }
>>


