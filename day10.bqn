s ← •Import "strings.bqn"
u ← •Import "utils.bqn"
ins ← •FLines¨ "input/"⊸∾¨ "ex10.in"‿"10.in"
ex‿in ← ins

mat ← u.ListToMat ex

≢ mat

(↕5) {𝕨‿𝕩 ⊑ mat}⌜ (↕5)

z ← ≠ ⥊ u.ListToMat in

valids ← ""‿"7|F"‿""‿"L-F"‿"SLFJ-|7"‿"J7-"‿""‿"J|L"‿""
vmat ← 3‿3 ⥊ valids

a ← (3‿3 ↕ mat)
b ← ⊑ <˘¨ <˘ (3‿3 ↕ mat)
b ∊˘ vmat

c ← ⊑ b

f ← {𝕩 ∊¨˘ vmat}

