s ← •Import "strings.bqn"

ex ← •file.Chars "input/ex5.in"
in ← •file.Chars "input/5.in"

lf ← @+10

input ← ex
chunks ← lf‿lf⊸s.Split input

seeds ← •ParseFloat¨ " " s.Split 7↓ ⊑ 1↑ chunks
ranges ← ⥊ ⋈˘ ∘‿2⥊seeds
borders ← ∧ ⍷ ∾(+`¨ ∾1↓¨¨maps)
maps ← •ParseFloat¨¨¨ ' '⊸s.Split¨¨ 1⊸↓¨ lf⊸s.Split¨ 1↓ chunks

GetCheck ← { 𝕨𝕊𝕩:
    a‿b‿c ← 𝕩
    (b ≤ 𝕨) ∧ (𝕨 < (b + c))
}

Transform ← { 𝕨𝕊𝕩:
    a‿b‿c ← 𝕩
    𝕨 + (a-b)
}

M2 ← {⟨Transform⟜𝕩, GetCheck⟜𝕩⟩}
MapFn ← { 𝕊𝕩:
    checks ← 1⊸⊑¨ M2¨ 𝕩
    transforms ← ⊑¨ M2¨ 𝕩
    R ← {⊑ ({𝕩 {𝕏𝕨}¨ checks} 𝕩) ⊐ 1}
    {R◶(transforms∾⟨⊣⟩) 𝕩}
}

funs ← MapFn¨ maps

Full ← {𝕩 {𝕏𝕨}{𝕨𝔽˜´⌽𝕩} funs}

⌊´ Full¨ borders


GenRange ← {𝕊𝕩:
    a‿b ← 𝕩
    a + ↕b
}

