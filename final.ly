\version "2.18.2"
\language "english"

\include "roman_numerals.include.ly"
\include "other_markup.include.ly"

\header {
  title = "Two Dances"
  composer = "Chandler Swift"
  tagline = ""
}

noWarning = \override NoteColumn #'ignore-collision = ##t 

dance_one_analysis = \lyricmode {
  \set stanza = #"G:     " % use spaces to adjust position of key indication
  \markup \rN { I } \skip 2
  \markup \rN { V 7 } \skip 2 
  \markup \rN { I } \skip 1 
  \markup \center-align \rN { V 0 9 / vi  }

  \set stanza = #" e:"
  \markup \rN { i } \skip 2
  \markup \rN { iv } \skip 4
  \markup \rN { V 0 9 }
  \markup \rN { i } \skip 4
  \markup \rN { iv }
  \markup \rN { i } \skip 2

  \set stanza = #"G:    "
  \markup \rN { ii } \skip 2
  \markup \rN { V 7 } \skip 2
  \markup \rN { I } \skip 2
  \markup \rN { vi } \skip 2

  \markup \rN { N } \skip 2
  \markup \center-align \rN { Fr + 6 } \skip 4
  \markup \rN { V }
  \markup \rN { Cad 6 4 } \skip 4
  \markup \rN { V 7 }
  \markup \rN { I } \skip 2
}

dance_two_analysis = \lyricmode {
  \set stanza = #"C:     "
  \markup \rN { I } \skip 2
  \markup \rN { V } \skip 2
  \markup \rN { ii } \skip 4
  \markup \rN { V 7 }
  \markup \rN { I } \skip 2

  \markup \rN { V 7 / vi } \skip 2
  \markup \rN { vi } \skip 2
  \markup \center-align \rN { Cad 6 4 / V } \skip 4
  \markup \center-align \rN { V 7 / V }
  \markup \rN { V } \skip 2

  \markup \rN { V 7 } \skip 2
  \markup \rN { I 6 } \skip 2
  \markup \rN { V } \skip 2
  \markup \rN { vi } \skip 2

  \markup \rN { ii } \skip 4
  \markup \rN { V }
  \markup \rN { iii } \skip 4
  \markup \rN { vi }
  \markup \rN { ii } \skip 4
  \markup \rN { V 7 }
  \markup \rN { I }
}

dance_one_melody = {
  \key g \major
  \time 3/4
  \repeat volta 2 {
    d4( g-.) b-. | c8 \circle b^"PT" a b c d | b4( d,-.) d-. | \acciaccatura as''16 b4( d,-.) ds-. |
    e b g | fs8 g a4 c~ | \circle c^"Sus" b4. a8 | b2. | \break
  }
  \repeat volta 2 {
    a8 b c4 e | \circle e8^"App" d c \circle b^"NT" c a | g4 b d | e b g |
    af c ef | cs ef d | b8 a g4. fs8 | g2. \break
  }
}

dance_two_melody = {
  \key c \major
  \repeat volta 2 {
    g8 f e4 c' | d c b | c a f | g8 f e2 |
    e8 fs gs4 e' | f8 e d c b a | b a g4 fs | g2. | \break
  }
  \repeat volta 2 {
    g8 a b4 d | g8 f e d c \circle a^"Cam" | b d g gs \circle a^"Esc" f | e2 \circle f4~^"Ant" |
    f8 g f e d4 | e8 f e d c4 | d8 c b g b d | c2. |
  }
}

dance_one_accompaniment = {
  \key g \major
  \repeat volta 2 {
    g,,=,4 <d' g b> <d g b> | d, <d' a' c> <fs a d> | g, <d' g b> <d g b> | g, <d' g b> <fs a c> |
    e, <g' b e> <g b e> | a, <a' c e> <fs a ds> | e, <e' g b>  <e a c> | <e g> <fs a> <g b> | 
  }
  \repeat volta 2 {
    a,4 <e' a c> <a c e> | d, <d fs a> <fs a c> | g, <d' g b> f, | e <e' g b> g, |
    af <c ef af> <ef af c> | ef, <g' a cs> <fs a d> | d, <d' g b> <d a' c> | g, <d' g b>2 |
  }
}
dance_two_accompaniment = {
  \key c \major
  \repeat volta 2 {
    c=4 <e g c> <g c e> | g, <g' b d> <g b d> | d, <f' a d> <g b d> | c, <e g c> c,8 d | 
    e4 <e' gs b> <gs b d> | a, <a' c e> <a c e> | d,, <d' g b> <d a' c> | g, <d' g b>2 | 

  }
  \repeat volta 2 {
    g,4 <d' g b> <f g b> | e, <e' g c> <g c e> | g, <b d g> <d g b> | <c e a> a <c e a> |
    d, <f' a d> <g b d> | e, <g' b e> <a c e> | d,, <d' f a> <d f b> | c, <e' g c>2 
  }
}

\score {
  \relative c' {
    \new PianoStaff <<
      \new Staff {
        \dance_one_melody
        \dance_two_melody
      }
      \new Staff <<
        \clef "bass"
        << {
          \dance_one_accompaniment
          \dance_two_accompaniment
        } \new Lyrics { \dance_one_analysis \dance_two_analysis } 
        >>    
      >>
    >>
  }
  \midi { \tempo 4 = 120 }
  \layout{}
}
