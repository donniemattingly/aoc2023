s ← •Import "strings.bqn"

ex ← •FLines "2023/input/ex1.in"
input ← •FLines "2023/input/1.in"

Digits ← {((𝕩 - '0') < 10) / 𝕩}
FirstAndLast ← { ⊏⍉(𝕩≍ ⌽𝕩)}
Calibration ← { •ParseFloat (FirstAndLast (Digits 𝕩))}

•Show +´ Calibration¨ input

spelled ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
replacements ← ⟨"1ne", "2wo", "3hree", "4our", "5ive", "6ix", "7even", "8ight", "9ine"⟩

ReplaceDigitFirst ← { spelled‿replacements s.ReplaceAll 𝕩 }
ReplaceDigit ← { ReplaceDigitFirst⍟2 𝕩 }

•Show +´ Calibration¨ (ReplaceDigit¨ input)