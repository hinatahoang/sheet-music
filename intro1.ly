\version "2.22.1"

\header {
  title = "Chân Trời Sự Kiện (Event Horizon)"
  subtitle = "Intro"
  tagline = ##f
}

global = {
  \key e \major
  \time 4/4
  \tempo "Trôi dạt, mờ ảo (Ethereal)" 4 = 60
}

pianoRight = \relative c''' {
  \global
  \clef treble
  \ottava #1
  % Hiệu ứng shimmering của piano ở quãng cao (Lydian)
  \tuplet 6/4 { e16\ppp dis b ais fis e } \tuplet 6/4 { e' dis b ais fis e }
  \tuplet 6/4 { e' dis b ais fis e } \tuplet 6/4 { e' dis b ais fis e } |
  
  \tuplet 6/4 { fis' e cis b gis fis } \tuplet 6/4 { fis' e cis b gis fis }
  \tuplet 6/4 { fis' e cis b gis fis } \tuplet 6/4 { fis' e cis b gis fis } |
  
  % Điểm rơi - Chân trời sự kiện
  \ottava #0
  <gis, b dis fis>1\arpeggio\fermata \bar "|."
}

pianoLeft = \relative c, {
  \global
  \clef bass
  % Tiếng bass dội vang sâu thẳm
  <e b' e>1~\sustainOn |
  q1~ |
  <e e,>1\arpeggio\fermata \bar "|."
}

guitar = \relative c' {
  \global
  \clef "treble_8"
  
  R1 |
  % Lực hút bắt đầu: Guitar vuốt dây từ xa xăm
  r2 r4 <b dis fis>8\<\glissando <e gis b>~ |
  % Khoảnh khắc vượt qua ranh giới
  q1\ff\fermata \bar "|."
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = "Piano"
    } <<
      \new Staff = "right" \pianoRight
      \new Staff = "left" \pianoLeft
    >>
    \new Staff \with {
      instrumentName = "Electric Guitar"
      midiInstrument = "electric guitar (clean)"
    } \guitar
  >>
  \layout { }
  \midi { }
}
