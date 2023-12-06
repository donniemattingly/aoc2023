s ← •Import "strings.bqn"

ex ← •FLines "input/ex6.in"
in ← •FLines "input/6.in"

ListToMat ← {⟨≠ 𝕩, ⌈´ ≠¨ 𝕩⟩ ⥊ ∾´𝕩}
Parse ←  {ListToMat {•ParseFloat¨ 1↓ (""⊸≢¨ 𝕩) / 𝕩}¨ " "⊸s.Split¨ 𝕩}

Dist ← { 𝕨𝕊𝕩: 0⊸⌈((𝕩-𝕨) × 𝕨)}
Opts ← {𝕩 Dist˜ (↕𝕩)}
WinCount ← {+´ 𝕩 < Opts 𝕨} 
Part1 ← {×´ WinCount¨˝ (Parse 𝕩)}

Parse2 ←  {•ParseFloat¨ ∾¨ {1↓ (""⊸≢¨ 𝕩) / 𝕩}¨ " "⊸s.Split¨ 𝕩}
Part2 ← WinCount´ Parse2

•Show Part1 in
•Show Part2 in