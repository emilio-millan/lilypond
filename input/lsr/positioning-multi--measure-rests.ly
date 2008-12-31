%% Do not edit this file; it is auto-generated from input/new
%% This file is in the public domain.
\version "2.12.0"
\header {
 doctitlees = "Posicionar los silencios multicompás"
 texidoces = "
A diferencia de los silencios normales, no existe una instrucción
predefinida para modificar la posición predefinida de un símbolo
multicompás sobre el pentagrama, adjuntándolo a una nota,
independientemente de cuál sea su forma.  Sin embargo, en la música
polifónica los silencios multicompás de las voces de numeración par e
impar están separados verticalmente.  La colocación de los silencios
multicompás se puede controlar como se ve a continuación:

"

texidocde = "
Anders als bei normalen Pausen gibt es keinen direkten Befehl, um die
vertikale Position von Ganztaktpausen zu beeinflussen, indem man sie an
eine Tonhöhe anhängt.  In polyphoner Notation wird aber dennoch die
Position der Pausen von geraden und ungeraden Stimmen voneinander
unterschieden.  Die Position von Ganztaktpausen kann wie folgt verändert
werden:
 "
  doctitlede = "Positionierung von Ganztaktpausen"

  lsrtags = "rhythms,tweaks-and-overrides"
  texidoc = "
Unlike ordinary rests, there is no predefined command
to change the staff position of a multi-measure
rest symbol of either form by attaching it to a note.  However,
in polyphonic music multi-measure rests in odd-numbered and
even-numbered voices are vertically separated.  The positioning
of multi-measure rests can be controlled as follows:
 "
  doctitle = "Positioning multi-measure rests"
} % begin verbatim


\relative c'' {
  % Multi-measure rests by default are set under the second line
  R1
  % They can be moved with an override
  \override MultiMeasureRest #'staff-position = #-2
  R1
  % A value of 0 is the default position;
  % the following trick moves the rest to the center line
  \override MultiMeasureRest #'staff-position = #-0.01
  R1
  % Multi-measure rests in odd-numbered voices are under the top line
  << { R1 } \\ { a1 } >>
  % Multi-measure rests in even-numbered voices are under the bottom line
  << { c1 } \\ { R1 } >>
  % They remain separated even in empty measures
  << { R1 } \\ { R1 } >>
  % This brings them together even though there are two voices
  \compressFullBarRests
  <<
    \revert MultiMeasureRest #'staff-position
    { R1*3 }
    \\
    \revert MultiMeasureRest #'staff-position
    { R1*3 }
  >>
}
