s ← •Import "strings.bqn"
ex ← •FLines "input/ex3.in"
in ← •FLines "input/3.in"

ListToMat ← {𝕩:
    h ← ≠ 𝕩
    w ← ⌈´ ≠¨ 𝕩
    h‿w ⥊ ∾´𝕩
    }

mat ← ListToMat ex

digits ← (-⟜'0' mat)
nums ← digits ∧ ((digits < 10)∧(digits > 0))
IsSymbol ← {(𝕩 ≠ '.') ∧ ((𝕩 < '0') ∨ ('9' < 𝕩))}
symbols ← IsSymbol mat

Up ← ∨ ⟜ «
Down ← ∨ ⟜ » 
Left ← ∨ ⟜ «⌾⍉ 
Right ← ∨ ⟜ »⌾⍉ 

((Up ∨ Down) ∨ (Left ∨ Right)) test
symMask ← Up Left Down Right symbols
numMask ← nums > 0

nums ⋈¨ numMask

a ← ⊏ numMask

DecimalParts ← {𝕊𝕩:
    𝕩 ∧ 10⊸⋆ 0⊸⌈ ¯1⊸+ ({(𝕩 × 𝕩 + 𝕨)}`⌾⌽ 𝕩)
}

d ← nums × DecimalParts˘ numMask

CalcVal ← {𝕊𝕩: {((𝕩 > 0) × 𝕩 + 𝕨)}` 𝕩}
calced ← CalcVal˘ d

e ←  ⊏ calced

GetVal ← {(𝕩 > 0) × (𝕨 ⌈ 𝕩)}`⌾⌽
vals ← GetVal˘ calced
adjacentNumbers ← symMask ∧ vals 
+´ ⍷ ⥊ symMask ∧ vals 

q ← 2 ⊏ adjacentNumbers

# I think this is the issue, because it only removes the middle not the last digit

DeDup ← {𝕩 × 𝕩 ≠ 𝕨}`

r ← DeDup˘ adjacentNumbers

s ← (∊˘ r) ∧ r

# 551094

+´ ⥊ s

digits←'0'+↕10
n‿m←≢input←>•FLines"input/ex3.in"

sympos←⍉>m(⌊∘÷˜⋈|)/⥊¬input∊digits∾'.'
digpos←(0≠≠)¨⊸/ <˘¨{+`1⊸<|+´˘+`⁼𝕩}⊸⊔ ⍉>m(⌊∘÷˜⋈|)/⥊input∊digits
near←{∨´⥊1⊸=⌈´¨|¨(<˘sympos)-⌜𝕩}¨digpos
nums←•ParseFloat¨⊑⟜input¨digpos
•Show +´near/nums