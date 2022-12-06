import data.set

/- #1

Formally prove that if there's an object, a, of some 
type, α, having some property (satisfying a predicate), 
P, then not every object of type α fails to have property, 
P. Add a brief comment before each line of your proof 
script to provide what amounts to the outline of a good
English language proof.
-/

example (α : Type) (P : α → Prop) : (∃ a, P a) → (¬(∀ x, ¬ P x)) :=
begin
assume h1,
assume h2, -- ¬p == p → false
cases h1 with a pa, -- can do cases on anything w/ exists
--if we give h2 a, it'll give us a proof of not pa
have npa := h2 a,
contradiction,
end


/- Extra credit. 

The converse of this proposition is clasically true. If
not every object lacks propery, P, then there must be some
object that has it. If you try to prove the converse in
our constructive logic (lean), what happens? Show you work, and
then briefly but clearly explain exactly what goes wrong.

take arrow and flip it the other direction

only way to move forward is to use classical.em, doesn't work otherwise. 
-/



/- #2

Consider the following binary relation, r, with domain
and co-domain both being ℕ. For each following question,
answer yes/no then briefly justify your answer.

( domain = ℕ, r = {(0,0),(1,1),(2,2)}, co-domain=ℕ )

A. Is this relation reflexive? - equal to itself 
  Reflexive : ∀ a, r a a FOR ALL VALUES IN THE DOMAIN
  no - doesn't hold true to every value in the domain (if domain were just 0,1,2),
  it'd be true, but it's not. 
  domain only matters in reflexive, not symmetric or transitive
  
  ( domain = {0,1,2}, r = {(0,0),(1,1),(2,2)}, co-domain={0,1,2} )
    in this case, it would be reflexive!

B. Is this relation symmetric? 
  Symmetric : r a b → r b a 
  yes, b/c symmetric doesn't care about the domain, just cares about if first value maps to second value in r
C. Is this relation transitive? 
  Transitive : r a b → r b c → r a c
  Yes, b/c the same number maps to itself every time
D. Is this relation an equivalence relation? 
  no, b/c in order for it to be an equivalence relation it must have all 3 of these properties

symmetry and transitive have to work fro everything in the relation, 
but not everything in the domain

-/

#check @reflexive
#check @symmetric
#check @transitive


/- #3

A binary relation, r, is said to be *anti-symetric* 
if, for all values in its domain, a and b, if r a b 
and if r b a then a = b. Give an example of a familiar
arithmetic relation that's anti-symmetric, and briefly
explain why it's so.

anti-symmetric means symmetric+, it's just symmetric extended  

>= or <= or == 

Anti-Symmetric : r a b → r b a → a = b 
Anti-Symmetric : (Symmetric r) → (a = b)
-/


/- #4
A binary relation, r, is said to be *asymmetric* if
whenever, for any a and b, if r a b then ¬ r b a. Be
careful to note that asymmetry and antisymmetry are
different properties.  Answer each of the following 
sub-questions. We give you a formal definition of anti

> or < 
-/

def is_asymmetric 
  {α : Type} 
  (r : α → α → Prop) : Prop 
  := ∀ (a b : α), r a b → ¬ r b a 

/- A.

Name a familar arithmetic relation that's asymmetric
and briefly explain why you think it's asymmetric.

Answer here:
< or > , 

b/c if a > b then b != > a
-/

/- C: 

An object cannot be related to itself in an asymmetric
relation. First, complete the following informal proof
of this statement.

Proof: Assume α, r, and a are as given (and in particular
assume that r is asymmetric). Now assume r a a. <finish
the proof>.

Answer here (rest of proof): 
if you assume r a a, which gives you the remaining goal of finding ¬ r a a, 
which is a contradiction 
-/

/- D.

Now prove a closely related proposition formally. 
Add a comment to each line of your formal proof 
so as to construct a good skeleton for a fluent 
English language proof.
-/

example
  (α : Type) 
  (r : α → α → Prop)
  (h : is_asymmetric r) :
¬ ∃ (a : α), r a a :=
begin
-- proof by negation
-- unfold is_asymmetric at h,
assume h,
cases h with a raa, -- you can do cases with ∃
unfold is_asymmetric at h, -- always break down the definitions if you don't know what to do
--you have to do at h because it's inside h, not just a variable
--if it's at the turnstile (where false is), then you can just do unfold is_asymmetric
have p2 := h a a,
--diff between let and have , is that let tells you where it came from (:= h a a) - switch it to let to understand
have nraa := p2 raa,
--send r a a into p2, which gives out nraa, which is a contradiction
contradiction, 
end


/- #5
Prove that equality on an inhabited (non-empty) type 
is not assymetric. In the following formalization we
assume there is a value (a : α), which establishes 
that α is inhabited.
-/

example (α : Type) (a : α): ¬ is_asymmetric (@eq α) :=
begin
assume assymEQ,
unfold is_asymmetric at assymEQ,
have p1 := assymEQ a a,
have neq := p1 (eq.refl a),
-- rfl == (eq.refl a) in this case
contradiction,


end

/- Extra credit: What exactly goes wrong in a formal 
proof if you drop the "inhibitedness" condition? Give
as much of a formal proof as you can then explain why
it can't be completed (if it can't!).
-/
example (α : Type) : ¬ is_asymmetric (@eq α) :=
begin
assume assymEQ,
unfold is_asymmetric at assymEQ,
-- NO VALUES OF TYPE α TO WORK WITH

end


/- #6
Two natural numbers, p and q, are said to be 
"equivalent mod m" if p % m = q % m, which makes
"equivalence mod m" a binary relation on natural
numbers. Here's a formal definition of this binary
relation on the natural numbers (given an m).
-/

def equiv_mod_m (m : ℕ) : ℕ → ℕ → Prop := 
  λ p q : ℕ, p % m = q % m

/-
Prove using Lean's definition of "equivalence" that 
equiv_mod_m is an equivalence relation for any natural
number, m. Here you'll also use Lean's definitions of
reflexive, symmetric, and transitive. They are as we
have covered in class. 

equivalence means that all three of these are true :reflexive, symmetric, and transitive
-/

example : ∀ m : ℕ, equivalence (equiv_mod_m m) :=
begin
assume m,
unfold equivalence equiv_mod_m,
--prove it's all three
split,

--SHOW REFLEXIVITY
unfold reflexive,
assume h,
exact rfl,

split,

--SHOW SYMMETRY
unfold symmetric,
assume x y,
assume premise,
--rewrite tactic!
--this replaces x % m in the bottom with the y % m, and then does rfl on it
rw premise,

--SHOW TRANSIVITIVITY
unfold transitive,
assume x y z,
assume p1 p2,
rw p1,
rw p2,
--same thing as above, just subs in the stuff and does rfl on it.

end



/- #7
Consider the relation, tin_rel, that associates people 
with U.S. taxpayer id numbers, which we'll represent as 
natural numbers here. 

Assume this relation is single-valued. Which of the 
following properties does this relation have? Give
a very brief justification of each answer. Assume
the domain is all living persons, and the co-domain
is all natural numbers.

single valued: 1 to 1 : one input can only have one output

-- it's a function: 
yes, because it's single valued

-- it's total: 
reflexivity has to be total for it to be applied

not every human has a US taxpayer id number, so no. 
(non US humans)
-- it's injective: 
yes, b/c two people don't map to the same taxpayer id number

-- it's surjective (where the co-domain is all ℕ):
no b/c every value in the codomain (every possible taxpayer id number) has a person associated to it
this would require infinite people, because there are infinite natural numbers. 

-- it's strictly partial:  
a function which there is a person with no taxpayer id
yes, b/c not every human has a US taxpayer id number

-- it's bijective: 
no, b/c this means injective & surjective - we showed it's not surjective, so no. 

-/



/- #8
Suppose r is the empty relation on the natural 
numbers. Which of the following properties does
it have? Explain each answer enough to show you
know why your answer is correct.

-- reflexive: no - doesn't cover the whole domain
-- symmetric: yes - because they both map to each other
-- transitive: yes - because the same numbers map to themselves
-/



/- #9
Here's a formal definition of this empty relation.
That there are no constructors given here means there 
are no proofs, which is to say that no pair can be 
proved to be in this relation, so it must be empty.
-/

inductive empty_rel : ℕ → ℕ → Prop

/-
Formally state and prove you answer for each of the
three properties. That is, for each property assert
either that empty_rel does have it or does not have it, 
then prove your assertion. Include English-language 
comments on each line to give the essential elements 
of a good English language proof.
-/


example : ¬reflexive empty_rel :=
begin
unfold reflexive,
assume h,
let x := h 0,
cases x,
end
-- b/c in this case, reflexivity doesn't cover the whole domain

example : symmetric empty_rel :=
begin
unfold symmetric,
assume a b h,
cases h,
end
--yes, b/c the numbers map to themselves

example : transitive empty_rel :=
begin
assume a b c h k,
cases h,
end
--same thign as above, the numbers map to themselves. 
/- #10
A relation, r, is said to have the property of being 
a *partial order* if it's reflexive, anti-symmetric,
and transitive. Give a brief English language proof 
that the subset relation on the subsets of any set, 
S (of objects of some type), is a partial order. 

Pf:  
Suppose S is a set, with a ⊆ S and b ⊆ S subsets. Then

1. Reflexive, a is a subset of itself
2. Anti-Symmetric, if a ⊆ b, and b ⊆ a, then it must be true that a == b
3. transitive, if a ⊆  b, and b ⊆  c, then a ⊆ c 

QED.
-/



/- #11 
Finally we return again to DeMorgan's laws, but
now for sets. You'll recall that these "laws" as we
have seent them so far tell us how to distribute ¬  
over ∨ and over ∧. You will also recall that set
intersection (∩) is defined by the conjunction (∧) 
of the membership predicates, set union (∪) by the
disjunction (∨), and set complement (Sᶜ for a set,
S), by negation (¬). It makes sense to hypothesize 
that we can recast DeMorgan's laws in terms of the
distribution of complement over set union and set
intersection. Indeed we can. Your job is to state
and prove (formally) the first DeMorgan laws for 
sets, which states that the complement of a union
of any two sets equals the intersection of their 
complements.

∪ = ∨ 
∩ = ∧ 
ᶜ = ¬ 

Hint: To prove that two sets are equal, S = T, use
the ext tactic. It applies a bew axiom (called set 
extensionality) that states that to prove S = T it 
suffices to prove S ↔ T, viewing the sets as being
defined by their logical membership predicates. You
know how to handle bi-implications. The rest you 
can do by seeing "not," "and," and "or" in place 
of complement, conjunction, and disjuction, resp.  
-/

example 
  (α : Type) 
  (a b: set α) :
  (a ∪ b)ᶜ = aᶜ ∩ bᶜ := 
begin
ext,
split,
assume notAuB,
split,
assume k,
have AuB := or.inl k,
have f := notAuB AuB,
contradiction,

assume xb,
have AuB := or.inr xb,
have f := notAuB AuB,
contradiction,

assume ACBC,
assume AUB,
cases AUB with A B,
have AC := ACBC.left,
contradiction,

have AB := ACBC.right,
contradiction,


end
