s ← •Import "strings.bqn"
u ← •Import "utils.bqn"

ex ← •FLines "input/ex2.in"
in ← •FLines "input/2.in"

line ← ⊑ ex
pick ← " 1 red, 2 green, 6 blue"

ParseGame ← {⊑ 1 ↓ (";"⊸s.Split)¨ (":" s.Split 𝕩)}

ParseColorPair ← {
    a‿"blue": (u.ToDec a)‿0‿0;
    b‿"green": 0‿(u.ToDec b)‿0;
    c‿"red": 0‿0‿(u.ToDec c)
}

ParsePick ← {" "⊸s.Split¨ s.Trim¨ ("," s.Split 𝕩)}

SumPick ← {+´ ParseColorPair¨ 𝕩}
SumGame ← {> (SumPick¨ ParsePick¨ 𝕩)}

valid ← 14‿13‿12
GameIsValid ← {⌊´ ⥊ valid ≥ ⍉𝕩}

Part1 ← {𝕩:
    validMask ← GameIsValid¨ SumGame¨ ParseGame¨ 𝕩
    idSum ← +´ validMask × 1 + ↕ ≠validMask
}

MinCount ← {⌈˝ 𝕩}

Part2 ← {powerSum ← +´ (×´)¨ MinCount¨ SumGame¨ ParseGame¨ 𝕩}

gameSums ← SumGame¨ ParseGame¨ ex

•Show Part1 in
•Show Part2 in