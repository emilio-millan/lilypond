\header{
filename =	 "preludes-2.ly";
title =	 "2";
composer =	 "Johann Sebastian Bach (1685-1750)";
enteredby =	 "jcn";
copyright =	 "public domain";
}

\include "paper20.ly"

one = \melodic{
	\octave c'';
	\textstyle "italic";
	r8\mf ['c-1( 'e-2 'g-4] ['e-2 'c-1 'bes-5 'g-3] |
	[)'a-4\< 'c-1( 'f-2 'a-4] ['f 'c c-5 'a-3] |
	[)'b-4 'g-1( 'b-2 d-4] ['b-2 'g f-5 \!d-3] |
	<
		{\voiceone; )e2-4\f r4 e-5 }
		{\voicetwo; <c2 'g> r4 <c 'g> }
	>
	\onevoice; |
	< 
		 { \voiceone; d2-4 r4 d-4 }
		 { \voicetwo; <c2 'a> r4 <c 'a> }
	>
	\onevoice; |
	< 
		 { \voiceone; d8 }
		 { \voicetwo; <'b8 'g> }
	>
	\onevoice;
	['g8-1\mf( 'b-2 d-4] 
	<
		{ \voiceone; )'b4 e-5 }
		{ \voicetwo; 'g4 'b }
	>
	\onevoice; |
	<
		{ \voiceone; c2 r4 < {c-5 ~ c8} {'a4 ~ 'a8} > }
		{ \voicetwo; c2 r4 'e4 ~ 'e8 }
	>
	\onevoice;
	['d-1\p( 'fis-2 'a-4] ['fis-2 'd-1 c-5 'a-3] |
	[)'b-4\< 'g-1( 'b-2 d-4] [ 'b-2 'g-1 f!-5 d-3] |
	[)e-4 'g-1( c-2 e-4] [c-2 'g g-5 e-3] |
	[)fis-4 'a-1( c-2 fis-4] [c 'a a-5 \!fis-3] |
	<
		{ \voiceone; )g2-5\f }
		{ \voicetwo; <d2 'b> }
	>
	\onevoice;
	r4 b4-2( |
	[c8-1 e-2 g c'] [g-2 e-1 bes-4 g-2] |
	[)a16->-3 g-2 f-1 e-3] [d c 'b!-3 'a-2] 
	['b-3\< 'g-1 'a 'b] [c-1 d e \!f] |
	g4-5\ff
	<
		{ \voiceone; c2-5 'b4-4 }
		{ \voicetwo; 'g2-2 'd4-1 }
	>
	\onevoice;
	<
		{ \voiceone;  c1^5 }
		{ \voicetwo; 'e1_1}
	>
	\onevoice;
	\bar "|.";
}

two = \melodic{
	\octave c;
	<
		{ \voiceone; c1 ~ c ~ c }
		{ \voicetwo; 'c1 ~ 'c ~ 'c }
	>
	\onevoice; |
	r8 [c-5( e-3 g-1] [e-3 c-5 c' e-4] |
	[)fis-3 d-5( fis-3 a-1] [fis-3 d-5 d' fis-4] |
	)g2-3 r4 g-2( |
	[)a8 'a-5( c-4 e-2] [c-4 'a-5 g e-3] |
	)fis2 r4 d-4 |
	% [g32-1( fis-2 g8.-1] ) 'g4 g( )'g\mr |
	
	% my edition has  mordents on every g here
	[g32-1( fis-2 g8.-1] ) 'g4 g ~ 'g |
	% 'g( )g\mr 'g( )g\mr |
	g ~ 'g g ~ 'g |
	g ~ 'g g ~ 'g |
	[g8 'g-5( 'b-4 d-2] ['b-4 'g-5 f!-1 d-3] |
	[)e-2 c-4 e-2 g-1] [e-3 c-5 c' e-4] |
	\textstyle "finger";
	f1^"3\\_1" ~ |
	[f8 d-3 e-2 c-4] g4-1 'g^"5\\_2" |
	<c1 'c1>
	\bar "|.";
}

global  = \melodic{
	\meter 4/4;
}

treble_staff = \type Staff = treble <
	\global
	\one
>

bass_staff = \type Staff = bass <
% bass = Staff <
	\clef "bass";
	\global
	\two
>

grand_staff = \type Grandstaff <
	\treble_staff
	\bass_staff
>

a4 = \paper{
	\paper_twenty
	linewidth= 195.\mm;
}

\score{
        % Moderato
	\grand_staff
	\paper{ \a4 }
	\midi{ \tempo 4 = 100; }
}

