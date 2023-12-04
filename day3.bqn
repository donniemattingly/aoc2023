s ← •Import "strings.bqn"
ex ← •FLines "input/ex3.in"
in ← •FLines "input/3.in"

ListToMat ← {𝕩:
    h ← ≠ 𝕩
    w ← ⌈´ ≠¨ 𝕩
    h‿w ⥊ ∾´𝕩
    }

Part1 ← {𝕊in:
    mat ← ListToMat in

digits ← (-⟜'0' mat)
nums ← digits ∧ (digits > 0)
test ← 3‿3⥊0‿0‿0‿0‿1‿0‿0‿0‿0 
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

DeDup ← {𝕩 × 𝕩 ≠ 𝕨}`

+´ ⍷ ⥊ DeDup˘ adjacentNumbers
}