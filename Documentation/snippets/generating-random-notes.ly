%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.20"

\header {
  lsrtags = "pitches, really-cool, scheme-language"

  texidoc = "
This Scheme-based snippet generates 24 random notes (or as many as
required), based on the current time (or any randomish number specified
instead, in order to obtain the same random notes each time): i.e., to
get different random note patterns, just change this number.

"
  doctitle = "Generating random notes"
} % begin verbatim


\score {
  {
    $(let ((random-state (seed->random-state (current-time))))
       (make-sequential-music
         (map (lambda (x)
                (let ((idx (random 12 random-state)))
                  (make-event-chord
                   (list
                    (make-music 'NoteEvent
                                'duration (ly:make-duration 2 0 1/1)
                                'pitch (ly:make-pitch
                                        (quotient idx 7)
                                        (remainder idx 7)
                                        0))))))
              (make-list 24))))
  }
}
