s ← •Import "strings.bqn"
u ← •Import "utils.bqn"
ins ← •FLines¨ "input/"⊸∾¨ "ex11.in"‿"11.in"
ex‿in ← ins

Expand ← {(1 + ∧´˘ '.'⊸= 𝕩) / 𝕩}
m‿n ← ≢ mat ← > Expand⌾⍉ Expand >ex
gc ← ≠gs←⍉>n(⌊∘÷˜⋈|)/⥊mat∊"#"
≢ distances ← (+˝|∘-)⎉1⎉1‿∞˜ gs
aa ← (<⌜˜↕gc) ∧ distances
+´ 0⊸<⊸/ ⥊ aa

a ← 1‿1
b ← 4‿5
Mh ← (+´|∘-)
F ← {𝕨𝕊𝕩:
    a‿b ← 𝕨
    c‿d ← 𝕩

    xdiff ← d-b
    f ← b + (×xdiff) × ↕(1 + | xdiff)

    ydiff ← c-a
    e ← a + (×ydiff) ×↕(1 + | ydiff)

    e ⋈⌜ f
}

# okay so I was pretty close, just making the wrong intermittent 
# points here if a/b is the larger of the two points, so just need to sort

y ← <˘gs
perms ←  y ⋈⌜ y

11‿5 F 1‿9

a Mh b
q ← 11‿5 F 1‿9

≠ path ← <˘ ⍷ 1↓(⊑˘ q) ∾ (¯1 ⊑˘ ⍉ q)

≢ mat

Er ← {9 × ∧´˘ '.'⊸= 𝕩}
cost ← mat ∊ "#."
r ← Er mat
s ← Er ⍉ mat

≢ mat
sp ← s +˘˘⌾⍉ cost
rp ← r +⎉0‿1 cost
actual ← rp ⌈ sp

{𝕩 ⊑ actual}¨ path 

s ← ∧¨ ⥊ perms ←  y ⋈⌜ y
paths ← ⍷ >r ← (∧´¨ ∊¨ s) / s

G ← {𝕊𝕩: 
p1‿p2 ← x
p1 F p2
}

p1‿p2 ← ⊏ paths
q ← {𝕩 ⊑ actual}¨ (p1 F p2)
path ← <˘ ⍷ 1↓(⊑˘ q) ∾ (¯1 ⊑˘ ⍉ q)