# Learning Notes
# Replicate / Indices 


/ 1‿2‿3‿4 # ⟨ 0 1 1 2 2 2 3 3 3 3 ⟩

# Here we get a new list with the indices repeated based on the list
# Replicate is more useful I think because you can filter with it

1‿0‿1 / "abc" # "ac"

# This is saying 'repeat index 0 once, 1 zero times, and 1 once
# it's cool because it's more capable than just filter but the
# 'base case' so to speak is a filter, like this

{𝕩 > 3}⊸/ ↕10 # ⟨ 4 5 6 7 8 9 ⟩

# so there are a couple things here, the range (↕) is being used
# to essentially make a list of that 𝕩 length
# the bind/before ⊸ here is saying 'before replicate, apply 𝔽
# which in this case is a function block that checks if 𝕩 is greater
# than 3 

# I can be more tacit with this, as most BQN should generally avoid
# placeholder variables in these situations I can do that with after ⟜

>⟜3⊸/ ↕10 # ⟨ 4 5 6 7 8 9 ⟩

# So for an advent of code problem I start with a list of strings

list ← ⟨"1000","2000","3000",⟨⟩,"4000",⟨⟩,"5000","6000",⟨⟩,"7000","8000","9000",⟨⟩,"10000" ⟩

# and I need to split it based on the empty list
# BQN Crate has this 

Split ← (⊢-˜+`×¬)⊸⊔

# Which I can tacit expand to this:

lengths ← 0=(⊑≢)¨ list

lengths Split list

(⊢-˜+`×¬) lengths

chunks ← (((+` lengths) × ¬lengths) - lengths) ⊔ list

nums ← •ParseFloat¨¨ chunks

⌈´>+´¨ nums

# Takes an array and returns the first and last element
FirstAndLast ← { ⊏⍉(𝕩≍ ⌽𝕩)}
FirstAndLast ↕ 10 # ⟨ 0 9 ⟩

# ⌽ reverses the list 𝕩
# ≍ couples the original list 𝕩 with the reversed ⍉𝕩
{𝕩 ≍ ⌽𝕩} ↕10
# ┌─                     
# ╵ 0 1 2 3 4 5 6 7 8 9  
#   9 8 7 6 5 4 3 2 1 0  
#                      ┘

# ⍉ transposes the array
# ⊏ picks the first major cell

{⊏⍉(𝕩 ≍ ⌽𝕩)} ↕10

# ⟨0 9⟩