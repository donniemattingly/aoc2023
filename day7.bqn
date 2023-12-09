s ← •Import "strings.bqn"
ex‿in ← •FLines¨ "input/"⊸∾¨ "ex7.in"‿"7.in"
ListToMat ← {⟨≠ 𝕩, ⌈´ ≠¨ 𝕩⟩ ⥊ ∾´𝕩}

hands ← ListToMat " "⊸s.Split¨ in

Get_winnings ← {𝕊𝕩:
    order‿types ← 𝕩
    hands_with_rank ← hands ∾˘ (types ∾¨ ({⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands)))    
    ordered_bids ← •ParseFloat¨ 1⊏˘ (2⊸⊏˘)⊸(⍒⊸⊏) hands_with_rank
    bid_multiplier ← ⌽ 1⊸+↕≠ordered_bids
    winnings ← +´ bid_multiplier × ordered_bids
}

order ← ('1'⊸+⟜↕9)∾"TJQKA"
types ← +´¨ ⊒¨ ⊏ ⍉ hands

•Show "Part 1: " ∾ •Repr Get_winnings order‿types

O ← {𝕩 ⊑ 1‿3‿4‿6‿10‿10‿10‿10}
TW ← {𝕩 ⊑ 3‿6‿10‿10‿10‿10‿10‿10}
TR ← {𝕩 ⊑ 6‿10‿10‿10‿10‿10‿10‿10}
TP ← 10˙
R ← ⊣◶⟨⊢,O, TW, TR, TP, TP, TP, TP⟩

order2 ← "J"∾('1'⊸+⟜↕9)∾"TQKA"
unadjusted_types ← 6⊸⌊ +´¨ ⊒¨ ≠⟜'J'⊸/¨ ⊏ ⍉ hands
jokers ← ≠¨ =⟜'J'⊸/¨ ⊏ ⍉ hands
types2 ← jokers R¨ unadjusted_types

•Show "Part 2: " ∾ •Repr Get_winnings order2‿types2
