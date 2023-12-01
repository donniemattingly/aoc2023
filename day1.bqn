s ← •Import "strings.bqn"
input ← •FLines "input/1.in"
digits ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩

nums ← <∘∾˘ ⍉ 2‿∘ ⥊ (⋈¨ ('0'+ 1+↕≠digits))∾(1↓¨ digits)

Part1 ← +´(•ParseFloat○⊏⍉○(≍⟜⌽ ((10⊸> -⟜'0')⊸/)))¨
Part2 ← Part1 digits‿nums⊸s.Replaceall⍟2¨

•Show Part1 input
•Show Part2 input