\version "2.17.6"

\header {
  lsrtags = "staff-notation, vocal-music"

  texidoc = "
This shows one approach to simplify adding many orchestral cues to the
piano reduction in a vocal score.  The music function @code{\\cueWhile}
takes four arguments: the music from which the cue is to be taken, as
defined by @code{\\addQuote}, the name to be inserted before the cue
notes, then either @code{#UP} or @code{#DOWN} to specify either
@code{\\voiceOne} with the name above the staff or @code{\\voiceTwo}
with the name below the staff, and finally the piano music in parallel
with which the cue notes are to appear.  The name of the cued
instrument is positioned to the left of the cued notes. Many passages
can be cued, but they cannot overlap each other in time.

"
  doctitle = "Adding orchestral cues to a vocal score"
}

cueWhile =
#(define-music-function
   (parser location instrument name dir music)
   (string? string? ly:dir? ly:music?)
   #{
     \cueDuring $instrument #dir {
       \once \override TextScript.self-alignment-X = #RIGHT
       \once \override TextScript.direction = $dir
       <>-\markup { \tiny #name }
       $music
     }
   #})

flute = \relative c'' {
  \transposition c'
  s4 s4 e g
}
\addQuote "flute" { \flute }

clarinet = \relative c' {
  \transposition bes
  fis4 d d c
}
\addQuote "clarinet" { \clarinet }

singer = \relative c'' { c4. g8 g4 bes4 }
words = \lyricmode { here's the lyr -- ics }

pianoRH = \relative c'' {
  \transposition c'
  \cueWhile "clarinet" "Clar." #DOWN { c4. g8 }
  \cueWhile "flute" "Flute" #UP { g4 bes4 }
}
pianoLH = \relative c { c4 <c' e> e, <g c> }

\score {
  <<
    \new Staff {
      \new Voice = "singer" {
        \singer
      }
    }
    \new Lyrics {
      \lyricsto "singer"
      \words
    }
    \new PianoStaff <<
      \new Staff {
        \new Voice {
          \pianoRH
        }
      }
      \new Staff {
        \clef "bass"
        \pianoLH
      }
    >>
  >>
}
