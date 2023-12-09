s ← •Import "strings.bqn"
ex‿in ← •FLines¨ "input/"⊸∾¨ "ex7.in"‿"7.in"
ListToMat ← {⟨≠ 𝕩, ⌈´ ≠¨ 𝕩⟩ ⥊ ∾´𝕩}

hands ← ListToMat " "⊸s.Split¨ in

Type ← (1+⊒+⊒⌾⌽)
Score ← {2‿2‿3‿3‿3: 3.5; 1‿2‿2‿2‿2: 2.5; 𝕩: ⌈´ 𝕩}
order ← ('1'⊸+⟜↕9)∾"TJQKA"
types ← +´¨ ⊒¨ ⊏ ⍉ hands
# first_cards ← {⊑ order ⊐ 𝕩}¨ 1↑¨ (⊏˘ hands)
# ranking ← types (14⋆6)⊸×⊸+ (+´¨ (14⋆⌽↕5) × {⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands))
hands_with_rank ← hands ∾˘ (types ∾¨ ({⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands)))    
ordered_bids ← •ParseFloat¨ 1⊏˘ (2⊸⊏˘)⊸(⍒⊸⊏) hands_with_rank
bid_multiplier ← ⌽ 1⊸+↕≠ordered_bids
winnings ← +´ bid_multiplier × ordered_bids


(2⊸⊏˘)⊸(⍒⊸⊏) hands_with_rank
# foo ← hands ∾˘ ({⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands))
# bar ← hands ∾˘ (types ∾¨ ({⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands)))
# •ParseFloat¨ 1⊏˘ (2⊸⊏˘)⊸(⍒⊸⊏) bar

T ← ∧(1+⊒+⊒⌾⌽)
Score ← {2‿2‿3‿3‿3: 3.5; 1‿2‿2‿2‿2: 2.5; 𝕩: ⌈´ 𝕩}
u ← "AAAAT"‿"AAAJJ"‿"AAAQJ"‿"AAQQJ"‿"AAQJT"‿"AKQJT"‿"JJJ28"
Score¨ T¨ u
e← "KK677"
T "KK677"

(∊ e) ≍ (⊒ e) 
(⊐ e)

S ← 11⊸- +´¨ ⊒¨

⊒ "T55J5"

# use a choose
# 4 of a kind, full house, and three of a kind 
# with any number of jokers are just four of a kind
# two pair will always go to full house
# one pair will go to # jokers + 2 (3 or 4 of a kind)
# high card will go to # jokers + 1

Q ← ⊣◶⟨1˙, 2˙, 3⊸×, 6˙, 6˙, 6˙, 6˙⟩

O ← {𝕩 ⊑ 1‿3‿4‿6‿10‿10‿10‿10}
TW ← {𝕩 ⊑ 3‿6‿10‿10‿10‿10‿10‿10}
TR ← {𝕩 ⊑ 6‿10‿10‿10‿10‿10‿10‿10}
TP ← 10˙

# this is funky but 𝕨 is # jokers and
# 𝕩 is rank before
# basically it gives the possible rank given the number of jokers
R ← ⊣◶⟨⊢,O, TW, TR, TP, TP, TP, TP⟩

order ← "J"∾('1'⊸+⟜↕9)∾"TQKA"
unadjusted_types ← 6⊸⌊ +´¨ ⊒¨ ≠⟜'J'⊸/¨ ⊏ ⍉ hands
jokers ← ≠¨ =⟜'J'⊸/¨ ⊏ ⍉ hands
types ← jokers R¨ unadjusted_types
hands_with_rank ← hands ∾˘ (types ∾¨ ({⊑ order ⊐ 𝕩}¨¨ (⊏˘ hands)))    
ordered_bids ← •ParseFloat¨ 1⊏˘ (2⊸⊏˘)⊸(⍒⊸⊏) hands_with_rank
bid_multiplier ← ⌽ 1⊸+↕≠ordered_bids
winnings ← +´ bid_multiplier × ordered_bids

4 R 6

te ← "JJJ34"‿"JJJJJ"‿"JJJ8J"
a ← ≠¨ =⟜'J'⊸/¨ te
b ← +´¨ ⊒¨ te
c ← +´¨ ⊒¨ ≠⟜'J'⊸/¨ te

a R¨ c
6⊸⌊+´¨ ⊒¨ u
⌽ ordered_bids

∨ ({⊑ order ⊐ 𝕩}¨¨ te)