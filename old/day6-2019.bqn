ex ← •FLines "old/ex6.in"
s ← •Import "strings.bqn"

orbits ← ")"⊸s.Split¨ ex
ordered_nodes ← ∧ ⍷ ∾´ orbits

edges ← {ordered_nodes ⊐ 𝕩}¨ orbits

array ← ↕ 11‿11 
mask ← ⊣⌜˜ 0¨ ↕11

/⁼ 1‿2‿3