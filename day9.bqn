s ← •Import "strings.bqn"
ins ← •FLines¨ "input/"⊸∾¨ "ex9.in"‿"9.in"
ex‿in ← {•ParseFloat¨¨ " "⊸s.Split¨ 𝕩}¨ ins
H ← {𝕩⊸{𝕩↓(-⟜»⍟𝕩 𝕨)}¨ ↕≠𝕩}
K ← {1 + (≠𝕩)-(+´ 0 ⍷ +´¨ H 𝕩)}
•Show {+´ {+´ {⊑ ¯1↑𝕩}¨(⌽ (K𝕩)↑(H 𝕩))}¨  𝕩}¨ ⟨in, ⌽¨ in⟩