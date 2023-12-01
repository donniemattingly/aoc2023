s ← •Import "strings.bqn"

ex ← •FLines "input/ex1.in"
input ← •FLines "input/1.in"


spelled ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
replacements ← ⟨"1ne", "2wo", "3hree", "4our", "5ive", "6ix", "7even", "8ight", "9ine"⟩

•Show +´(•ParseFloat○⊏⍉○(≍⟜⌽ ((10⊸> -⟜'0')⊸/)))¨ input

ReplaceDigitFirst ← { spelled‿replacements s.ReplaceAll 𝕩 }
ReplaceDigit ← { ReplaceDigitFirst⍟2 𝕩 }

•Show +´ Calibration¨ (ReplaceDigit¨ input)

Fun ← (≍⟜⌽ ((10⊸> -⟜'0')⊸/))
Gun ← ⊏⍉
T ← Gun Fun
S ← ⊏⍉○(≍⟜⌽ ((10⊸> -⟜'0')⊸/))
S "abc124"
