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

# Stole this code from a previous advent of code solution
# https://gitlab.com/icen/aoc21/-/blob/main/12.bqn⊣
text ← •file.Lines "12.in" 
Split ← ((⊢-˜+`×¬)∘=⊔⊢)
nodes ← ({⍷(¬𝕩∊"start"⋈"end")/𝕩} ∾'-'⊸Split¨ text) ∾ <"end"
lesser ← (<"start") ∾  / {∧´ 𝕩 ∊ 'a' + ↕26}¨ nodes
# the adjacency matrix should be symmetric, except for the end node which should have no outbound nodes
# and the start node, which should have no inbound nodes
adj ← {𝕩∧»˘(≢𝕩)⥊1} {𝕩 ∧ ¬>(-≠nodes)↑<(≠nodes)⥊1} (⍉∨⊢) ({𝕨∾'-'∾𝕩}⌜˜ nodes) ∊ text
# If this is a terminal node, return the node unchanged
# Else join it to each outbound path
Join ← { 𝕨𝕊⟨⟩: ⋈𝕨; 𝕨𝕊𝕩: (<𝕨) ∾¨ 𝕩 }
# Filter out any paths that have visited the same lesser node more than once
Filter ← {(¬> { 1 ∊ ⊒ (𝕩∊lesser)/𝕩 }¨𝕩)/𝕩}
Advance ← {Filter ⍷ ∾ 𝕩 Join¨ /¨ <˘ (¯1⊑¨𝕩) ⊏ adj}
_fix ← {𝕊∘⊢⍟≢⟜𝔽𝕩}

p1 ← ≠Advance _fix ⋈⋈0

# Allow at most a single return to a small cave, and no double returns
Lenient ← {(> { (¬2∊o) ∧ 1 ≥ +´ 1=o←(⊒𝕩)×(𝕩∊lesser) }¨𝕩)/𝕩}
Adv ← {Lenient ⍷ ∾ 𝕩 Join¨ /¨ <˘ (¯1⊑¨𝕩) ⊏ adj}
p2 ← ≠ paths ← Adv _fix ⋈⋈0
#•Show¨ ∧ paths ⊏¨ <nodes # This is very slow on the real input
p1‿p2



## Breaking down this adjaceny matrix construction
adj ← {𝕩∧»˘(≢𝕩)⥊1} {𝕩 ∧ ¬>(-≠nodes)↑<(≠nodes)⥊1} (⍉∨⊢) ({𝕨∾'-'∾𝕩}⌜˜ nodes) ∊ text

# This creates a square matrix of size ≠ nodes essentially making the string
# representation of the edges
{𝕨∾'-'∾𝕩}⌜˜ nodes

# this converts that matrix of text to 1s if the edge is in the input and 0 otherwise
({𝕨∾'-'∾𝕩}⌜˜ nodes) ∊ text

# this applies a logical or with the original and transposed matrix,
# essentially here we're making the inverse of the relations / edges
(⍉∨⊢) ({𝕨∾'-'∾𝕩}⌜˜ nodes) ∊ text

#

# ???
{𝕩 ∧ ¬>(-≠nodes)↑<(≠nodes)⥊1} (⍉∨⊢) ({𝕨∾'-'∾𝕩}⌜˜ nodes) ∊ text