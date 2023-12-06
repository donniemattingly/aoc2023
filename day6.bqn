s ← •Import "strings.bqn"
ex‿in ← •FLines¨ "input/"⊸∾¨ "ex6.in"‿"6.in"

ListToMat ← {⟨≠ 𝕩, ⌈´ ≠¨ 𝕩⟩ ⥊ ∾´𝕩}
Parse ←  {ListToMat {•ParseFloat¨ 1↓ (""⊸≢¨ 𝕩) / 𝕩}¨ " "⊸s.Split¨ 𝕩}

WinCount ← {+´ 𝕩 < (0⊸⌈ ⊢×-)⟜↕ 𝕨} 
Part1 ← {(×´) (WinCount¨˝) (Parse 𝕩)}

Parse2 ←  {•ParseFloat¨ ∾¨ {1↓ (""⊸≢¨ 𝕩) / 𝕩}¨ " "⊸s.Split¨ 𝕩}
Part2 ← WinCount´ Parse2

•Show Part1 in
•Show Part2 in