s ← •Import "strings.bqn"

ex ← •FLines "input/ex4.in"
in ← •FLines "input/4.in"

ParseCard ← {•ParseFloat¨¨ ((""⊸≢¨)⊸ /)¨ (" "⊸s.Split¨ ⊑ "|"⊸s.Split¨ 1↓":" s.Split 𝕩)}

ScoreCard ← {
    winning‿card ← ParseCard 𝕩 
    2 ⋆ 1 -˜ +´ winning ∊ card
}


Part1 ← {+´ ⌊¨ ScoreCard¨ 𝕩}

•Show Part1 in

Score2 ← {
    a‿b ← ParseCard 𝕩
    +´ a ∊ b
}

ListToMat ← {𝕩:
    h ← ≠ 𝕩
    w ← ⌈´ ≠¨ 𝕩
    h‿w ⥊ ∾´𝕩
    }

score ← Score2¨ in

# score ← 3‿0‿1‿0
c ← (≠score)↑¨1˙¨¨↕¨score
d←(↕≠c)
Shift¨ d⋈¨c
Shift ← {F amt‿vals: ((¯1 × amt) - 1) ⌽ vals}

f ← Shift¨ d⋈¨c
mat ← ListToMat f
diag ← (=⌜○↕´)≢mat

+˝ mat