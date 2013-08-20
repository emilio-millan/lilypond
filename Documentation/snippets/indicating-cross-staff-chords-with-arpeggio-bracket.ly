%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.25"

\header {
  lsrtags = "keyboards, real-music"

  texidoc = "
An arpeggio bracket can indicate that notes on two different staves are
to be played with the same hand. In order to do this, the
@code{PianoStaff} must be set to accept cross-staff arpeggios and the
arpeggios must be set to the bracket shape in the @code{PianoStaff}
context.


(Debussy, Les collines d’Anacapri, m. 65)

"
  doctitle = "Indicating cross-staff chords with arpeggio bracket"
} % begin verbatim


\new PianoStaff <<
  \set PianoStaff.connectArpeggios = ##t
  \override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
  \new Staff {
    \relative c' {
      \key b \major
      \time 6/8
      b8-.(\arpeggio fis'-.\> cis-. e-. gis-. b-.)\!\fermata^\laissezVibrer
      \bar "||"
    }
  }
  \new Staff {
    \relative c' {
      \clef bass
      \key b \major
      <<
        {
          <a e cis>2.\arpeggio
        }
        \\
        {
          <a, e a,>2.
        }
      >>
    }
  }
>>
