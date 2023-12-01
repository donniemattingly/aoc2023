input ← •FLines "2022/input/1.in"

lengths ← 0⊸=≠¨ input
split ← ((⊢-˜+`×¬) lengths) ⊔ input
parsed ← •ParseFloat¨¨ split
sums ← +´¨ parsed
max ← ⌈´sums

+´ 3↑ ∨ sums

