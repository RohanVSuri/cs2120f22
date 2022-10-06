/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: yes

B: Why? Because b is red


#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: no

B: Why? b/c the meaning of or is that there will be a situation where I get neither 
flowers or chocolates, which means that i will be unhappy


#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/no: no 

B. Why? Because we haven't declared the moon, and what it is made up of - it could be made up of blue cheese


#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no: yes

B. Why? if P implies false, and the expression is true, then P must be false



#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: yes

B. Why? because every single zebra has stripes, and zoe IS a zebra


#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: no

B: Why? only the singular Z zebra has stripes, it doesn't specify if all zebras have stripes


#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: no

B. Why? this is saying wind blows -> leaves move, but not leaves move -> wind blows : it only goes one way, not the other


#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: no

B. Why? it's or, not xor
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y. x or not Y

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).
yes
x=true, y=false
x=true, y=true
x=false, y=false
all situations where it is satisfiable

#2B: Is it valid? Explain your answer. 
no, it is not valid - in the situation: x=false, y=true, it evaluates to false or false, which is not true
validity means that in every situation the expression is true, but it is not here!

-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check ∀ (P Q : Prop), (P ↔ Q) → (P → Q)



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer: for all natural numbers n and m, if (n is less than m), then it 
is true that m - n is greater than zero 
-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n

/-
Answer: For all natural numbers m, there exists a natural number n where m is greater than or equal to n
-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer:for all natural numbers n, n is even OR n is odd 
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer: for all propositions p, it is true that either P or not P is true 
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer: for all propositions P, it is true that not (p or not p) is true
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 
-/

variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2

/-
if a1 has a virus, and then if a1 and a2 come in close contact, then a2 has the virus
-/
