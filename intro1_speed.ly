\version "2.22.1"

\header {
  title = "Event Horizon"
  subtitle = "Ethereal Intro"
  tagline = ##f
}

global = {
  \key e \major
  \time 4/4
  % Tempo chậm, lơ lửng
  \tempo "Trôi dạt, siêu thực (Ethereal)" 4 = 50
}

pianoRight = \relative c''' {
  \global
  \clef treble
  % Đẩy lên quãng cực cao để tạo cảm giác những vì sao/hạt ánh sáng
  \ottava #1
  \set tupletSpannerDuration = #(ly:make-moment 1/4)
  
  % Chùm 6 nốt rải liên tục trên nền Emaj7#11 (E Lydian)
  \tuplet 6/4 { e16\ppp dis b ais gis fis } \tuplet 6/4 { e' dis b ais gis fis }
  \tuplet 6/4 { e' dis b ais gis fis } \tuplet 6/4 { e' dis b ais gis fis } |
  
  \tuplet 6/4 { fis' e cis b ais gis } \tuplet 6/4 { fis' e cis b ais gis }
  \tuplet 6/4 { fis' e cis b ais gis } \tuplet 6/4 { fis' e cis b ais gis } |
  
  % Khoảnh khắc vượt qua chân trời sự kiện - Rơi vào khoảng không
  \ottava #0
  <e, gis b dis fis ais>1\arpeggio\fermata \bar "|."
}

pianoLeft = \relative c, {
  \global
  \clef bass
  % Tiếng bass dội vang sâu thẳm, giữ nguyên (pedal)
  <e b' e>1~\sustainOn |
  q1~ |
  <e e,>1\arpeggio\fermata \bar "|."
}

guitar = \relative c' {
  \global
  \clef "treble_8"
  
  % Im lặng ở nhịp đầu
  R1 |
  % Lực hút bắt đầu: Guitar kéo volume (swell) và vuốt dây từ xa xăm
  r2 r4 <b dis fis>8\<\glissando <e gis b>~ |
  % Chạm vào chân trời sự kiện, âm thanh bùng nổ rồi ngân dài vào cõi hư vô
  q1\ff\fermata \bar "|."
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = "Piano (Ambient)"
    } <<
      \new Staff = "right" \pianoRight
      \new Staff = "left" \pianoLeft
    >>
    \new Staff \with {
      instrumentName = "Electric Guitar"
      % Sử dụng giả lập tiếng guitar clean (hợp với các hiệu ứng delay/reverb ngoài đời)
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
