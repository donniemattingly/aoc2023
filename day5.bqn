s ← •Import "strings.bqn"

ex ← •file.Chars "input/ex5.in"
in ← •file.Chars "input/5.in"

lf ← @+10
SplitAtDoubleLineFeed ← lf‿lf⊸s.Split


input ← ex
chunks ← SplitAtDoubleLineFeed input

seeds ← 1↑ chunks
maps ← •ParseFloat¨¨¨ ' '⊸s.Split¨¨ 1⊸↓¨ lf⊸s.Split¨ 1↓ chunks

map1 ← ⊑ maps
m1 ← ⊑ map1

ParseMapping ← {𝕊 ⟨dest, source, range⟩: source - dest}
ParseMapping m1

ApplyMapping ← { 𝕨𝕊𝕩:
    ⟨dest, source, range⟩ ← 𝕨
    delta ← source - dest
    K ← {(⊑ 𝕩 ∊ source + ↕range) ⊑ ⟨0, ¯1 × delta⟩}
    𝕩 + K¨ 𝕩
}

GetMapping ← {𝕊𝕩:
    ⟨dest, source, range⟩ ← 𝕩
    delta ← source - dest
    K ← {(⊑ 𝕩 ∊ source + ↕range) ⊑ ⟨0, ¯1 × delta⟩}
}

⟨dest, source, range⟩ ← m1
delta ← source - dest

K ← {(⊑ 𝕩 ∊ source + ↕range) ⊑ ⟨0, ¯1 × delta⟩}

(↕100) ApplyMapping´ ⊑ maps

borders ← ∧ ⍷ ∾(+`¨ ∾1↓¨¨maps)

≠ borders

map1 


GetCheck ← { 𝕨𝕊𝕩:
    a‿b‿c ← 𝕩
    •Show 𝕩‿𝕨
    (b ≤ 𝕨) ∧ (𝕨 < (b + c))
}

Transform ← { 𝕨𝕊𝕩:
    a‿b‿c ← 𝕩
    𝕨 + (a-b)
}

2 GetCheck m1
99 Transform m1

Y←GetCheck⟜m1◶⟨⊣, Transform⟜m1⟩

MakeCheckAndMap ← {GetCheck⟜𝕩◶⟨⊣, Transform⟜𝕩⟩}

TransformForMap ← {MakeCheckAndMap´ 𝕩}

funs ← TransformForMap¨ maps