\version "2.22.1"

\header {
  title = "Event Horizon"
  subtitle = "Ethereal Space & Echoes"
  tagline = ##f
}

global = {
  \key des \major
  \time 4/4
  % Tempo rất chậm, như trôi dạt trong khoảng không vô tận
  \tempo "Lơ lửng, vang vọng (Ambient)" 4 = 45
}

pianoRight = \relative c''' {
  \global
  \clef treble
  \ottava #1
  
  % Nhịp 1: Khoảng không rộng lớn, nốt nhạc cô đơn lấp lánh
  r8 \tuplet 3/2 { c16\pp( f, g } c4~ c2) |
  
  % Nhịp 2: Mô phỏng tiếng vang (delay/echo) bằng các chùm nốt rơi tự do và dồn dập
  \tuplet 6/4 { g'16\p f c g f c } \tuplet 6/4 { g''16 f c g f c } 
  \tuplet 6/4 { g''16\mp f c g f c } \tuplet 6/4 { g''16\mf f c g f c } |
  
  % Nhịp 3: Lực hút hố đen (thời gian giãn nở, dồn nén)
  \tuplet 6/4 { c'16\f( g f c g f) } \tuplet 6/4 { c'16( g f c g f) }
  \tuplet 6/4 { c'16( g f c g f) } c'4\ff\fermata |
  
  % Nhịp 4: Rơi vào hư vô (Điểm kỳ dị)
  \ottava #0
  <c,,, f g c>1\arpeggio\ppp\fermata \bar "|."
}

pianoLeft = \relative c, {
  \global
  \clef bass
  
  % Đạp pedal liên tục (\sustainOn) để hòa trộn tất cả tần số, tạo Reverb khổng lồ
  <des aes' f'>1\ppp\sustainOn |
  q1 |
  <des aes' des f>1\p |
  % Chút dư âm cuối cùng
  <des aes' des f>1\arpeggio\ppp\sustainOn\fermata \bar "|."
}

guitar = \relative c'' {
  \global
  \clef "treble_8"
  
  % Nhịp 1: Harmonics siêu thực (âm bồi trong trẻo như pha lê)
  \harmonicsOn <c f>1\ppp |
  
  % Nhịp 2: Tắt harmonics, bắt đầu swell (tăng âm lượng từ từ)
  \harmonicsOff r2 r4 <aes c>4\p\<~ |
  
  % Nhịp 3: Glissando - Bị kéo tuột vào cõi vô định
  <aes c>2. <f c'>4\glissando |
  
  % Nhịp 4: Cú va chạm âm thanh tĩnh lặng
  <des aes' f'>1\fff\fermata \bar "|."
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
      % Làm cho đường vuốt nốt của guitar trông gãy gọn, méo mó
      \override Glissando.style = #'zigzag
    }
  }
  \midi { }
}
