s ← •Import "strings.bqn"
ex‿in ← •FLines¨ "input/"⊸∾¨ "ex7.in"‿"7.in"
ListToMat ← {⟨≠ 𝕩, ⌈´ ≠¨ 𝕩⟩ ⥊ ∾´𝕩}
ex

hands ← (" "⊸s.Split¨ ex)

Type ← ⌈´ (1+⊒+⊒⌾⌽)
order ← ('1'⊸+⟜↕9)∾"TJQKA"
types ← Type¨ ⊑¨ hands
# t ← (ListToMat hands) ∾˘ (Type¨b)
first_cards ← {⊑ order ⊐ 𝕩}¨ 1↑¨ (⊏˘(ListToMat hands))
ranking ← types 100⊸×⊸+ first_cards
hands_with_rank ← (ListToMat hands) ∾˘ ranking    
sorted_hands ← (2⊸⊏˘)⊸(⍒⊸⊏) hands_with_rank
ordered_bids ← •ParseFloat¨ 1⊏˘ sorted_hands
bid_multiplier ← ⌽ 1⊸+↕≠ordered_bids
winnings ← +´ bid_multiplier × ordered_bids