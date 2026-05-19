\version "2.22.1"

\header {
  title = "Event Horizon"
  subtitle = "Ethereal Space & Echoes"
  tagline = ##f
}

global = {
  \key des \major
  \time 4/4
  \tempo "Lơ lửng, vang vọng (Ambient)" 4 = 45
}

pianoRight = \relative c''' {
  \global
  \clef treble
  \ottava #1
  
  % Nhịp 1: Bắt đầu ở C6
  r8 \tuplet 3/2 { c16\pp( f, g } c4~ c2) |
  
  % Nhịp 2: Fix lỗi cộng dồn quãng. Các nốt sẽ rơi chính xác từ G6 xuống C5
  \tuplet 6/4 { g'16\p f c g f c } \tuplet 6/4 { g''16 f c g f c } 
  \tuplet 6/4 { g''16\mp f c g f c } \tuplet 6/4 { g''16\mf f c g f c } |
  
  % Nhịp 3: Lực hút hố đen. Rơi từ C7 xuống F5
  \tuplet 6/4 { c''16\f( g f c g f) } \tuplet 6/4 { c''16( g f c g f) }
  \tuplet 6/4 { c''16( g f c g f) } c''4\ff\fermata |
  
  % Nhịp 4: Trở về quãng an toàn C5
  \ottava #0
  <c,, f g c>1\arpeggio\ppp\fermata \bar "|."
}

pianoLeft = \relative c, {
  \global
  \clef bass
  
  <des aes' f'>1\ppp\sustainOn |
  q1 |
  <des aes' des f>1\p |
  <des aes' des f>1\arpeggio\ppp\sustainOn\fermata \bar "|."
}

guitar = \relative c'' {
  \global
  \clef "treble_8"
  
  % Nhịp 1: Harmonics ở C5
  \harmonicsOn c1\ppp |
  
  % Nhịp 2: Bắt đầu kéo volume
  \harmonicsOff r2 r4 aes4\p\<~ |
  
  % Nhịp 3: Chuyển thành glissando đơn nốt (an toàn cho compiler)
  aes2. f4\glissando |
  
  % Nhịp 4: Hợp âm điểm rơi
  <des, aes' f'>1\fff\fermata \bar "|."
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = "Ambient Piano"
    } <<
      \new Staff = "right" \pianoRight
      \new Staff = "left" \pianoLeft
    >>
    \new Staff \with {
      instrumentName = "Space Guitar"
      midiInstrument = "electric guitar (clean)"
    } \guitar
  >>
  \layout { 
    \context {
      \Score
      \override Glissando.style = #'zigzag
    }
  }
  \midi { }
}
