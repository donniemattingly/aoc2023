s ← •Import "strings.bqn"

ex ← •FLines "input/ex1.in"
input ← •FLines "input/1.in"


digits ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
# replacements ← ⟨"1ne", "2wo", "3hree", "4our", "5ive", "6ix", "7even", "8ight", "9ine"⟩

a ← ⋈¨ ('0'+ 1+↕≠digits)
b ← 1↓¨ digits
c ← ⍉ 2‿∘ ⥊ a∾b
nums ← <∘∾˘c

Part1 ← +´(•ParseFloat○⊏⍉○(≍⟜⌽ ((10⊸> -⟜'0')⊸/)))¨
Part2 ← Part1 digits‿nums⊸s.Replaceall⍟2¨

•Show Part1 input
•Show Part2 input