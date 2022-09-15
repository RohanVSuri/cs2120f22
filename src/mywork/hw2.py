# Be sure you've done pip install z3-solver
from z3 import *


# Here's a file you can often copy as a starting 
# point on a working program to solve some problem
# of interest. Here the problem is to compute and
# return a non-negative square root of argument, n 
def hw2():
    
    
    # Create z3 variable(s) representing the unknown
    # Here, the unknown, x, is the square root of n.
    X = Bool("X")
    Y = Bool("Y")
    Z = Bool("Z")
    
    #1. X ∨ Y, X ⊢ ¬Y             -- affirming the disjunct 
    #x or y, x ⊢ notY
    #not a valid statement
    #
    
    #first translate to prop. logic, then translate to z3
    #``
    

    
    
    # 1. X ∨ Y, X ⊢ ¬Y             -- affirming the disjunct 
    #if X or Y is true, that implies that Not(Y) is true
    C1 = Implies((And(Or(X,Y), X)), Not(Y))
    print(isValid(C1))
    # 2. X, Y ⊢ X ∧ Y              -- and introduction
    #if X And Y are true, that implies that X and Y are true
    C2 = Implies(And(X, Y), And(X, Y))
    print(isValid(C2))
    # 3. X ∧ Y ⊢ X                 -- and elimination left
    #if X and Y are true, that implies that X is true
    C3 = Implies(And(X, Y), X)
    print(isValid(C3))
    # 4. X ∧ Y ⊢ Y                 -- and elimination right
    #if X And Y are true, that implies that Y is true
    C4 = Implies(And(X, Y), Y)
    print(isValid(C4))
    # 5. ¬¬X ⊢ X                   -- negation elimination 
    #if not(not(x)) is true, that implies that X is true
    C5 = Implies(Not(Not(X)), X)
    print(isValid(C5))
    # 6. ¬(X ∧ ¬X)                 -- no contradiction
    #notting x and not x is true
    C6 = Not(And(X, Not(X)))
    print(isValid(C6))
    # 6. X ⊢ X ∨ Y                 -- or introduction left
    #if X is true, implies that X or Y is true
    C62 = Implies(X, Or(X, Y))
    print(isValid(C62))
    # 7. Y ⊢ X ∨ Y                 -- or introduction right
    #if Y is true, that implies that X or Y is true
    C7 = Implies(Y, Or(X, Y))
    print(isValid(C7))
    # 8. X → Y, ¬X ⊢ ¬ Y           -- denying the antecedent
    #if X is true, that implies that Y is true, and if not(x) is true, that implies that not(y) is true
    C8 = And(Implies(X, Y), Implies(Not(X), Not(Y)))
    print(isValid(C8))
    # 9. X → Y, Y → X ⊢ X ↔ Y      -- iff introduction
    #if x is true, that implies that y is true, and if y is true, that implies that x is true, which implies that x == y
    C9 = Implies(And(Implies(X, Y), Implies(Y, X)), X==Y)
    print(isValid(C9))
    # 10. X ↔ Y ⊢ X → Y            -- iff elimination left
    #if X == Y, that implies that X is true if Y is true
    C10 = Implies(X==Y, Implies(X, Y))
    print(isValid(C10))
    # 11. X ↔ Y ⊢ Y → X            -- iff elimination right
    #if X == Y, that implies that Y is true if X is true
    C11 = Implies(X==Y, Implies(Y, X))
    print(isValid(C11))
    # 12. X ∨ Y, X → Z, Y → Z ⊢ Z  -- or elimination
    #if X or Y is true, and if X is true, that means that X is true, and if Y is true, that means that Z is true, which implies that Z is true
    C12 = Implies(And(Or(X, Y), Implies(X, Z), Implies(Y, Z)), Z)
    print(isValid(C12))
    # 13. X → Y, Y ⊢ X   #next false          -- affirming the conclusion
    #if x then y, if y then x
    #if x is true, that means that y is true, and if y is true, that means that x is true
    C13 = And(Implies(X, Y), Implies(Y, X))
    print(isValid(C13))
    
    # 14. X → Y, X ⊢ Y             -- arrow elimination
    #if X is true, that means that Y is true, and if X is true, that implies that Y is true
    C14 = And(Implies(X, Y), Implies(X, Y))
    print(isValid(C14))
    
    # 15. X → Y, Y → Z ⊢ X → Z     -- transitivity of → 
        #if x implies y, and y implies z then x implies z
    C15 = Implies(And(Implies(X, Y), Implies(Y, Z)), Implies(X, Z))
    print(isValid(C15))
    # 16. X → Y ⊢ Y → X            -- converse
    #if X is true, that means that Y is true, which implies that Y is true when X is true
    C16 = Implies(Implies(X, Y), Implies(Y, X))
    print(isValid(C16))
    
    # 17. X → Y ⊢ ¬Y → ¬X          -- contrapositive
    #if X is true, that implies that Y is true, which implies that not(X) implies not(y) 
    C17 = Implies(Implies(X, Y), Implies(Not(Y), Not(X)))
    print(isValid(C17))
    # 18. ¬(X ∨ Y) ↔ ¬X ∧ ¬Y       -- DeMorgan #1 (¬ distributes over ∨)
    #If not(X or Y) is true, that equals not(X) and not(Y)
    C18 = Not(Or(X, Y)) == And(Not(X), Not(Y))
    print(isValid(C18))
    # 19. ¬(X ∧ Y) ↔ ¬X ∨ ¬Y       -- Demorgan #2 (¬ distributes over ∧)
    #not(X and Y) is equal to not(X) or not(Y)
    C19 = Not(And(X, Y)) == Or(Not(X), Not(Y))
    print(isValid(C19))
    
    # Important: This is where you express what
    # values count as solutions using propositional
    # logic, but in the slightly different syntax
    # of Z3 expressions.
    # C1 = (x*x == n)     # a solution squared must be n
    # C2 = (x >= 0)       # and must also be non-negative
    # C = And(C1, C2)     # combine using logical "and"
    
    
    # Create a Z3 "SMT" solver object, and give it 
    # the overall constraint to be solved, here C.
   # s = Solver()
   # s.add(C3)
    #s.add(C32)
    
    # Run the Z3 model finder, capturing "sat"
    # or "unsat" as the return value 
   # isSat = s.check()
    
    # If there's a model/solution return it 
    #if (isSat == sat):
    #    return s.model()
    # otherwise return inconsistent value for error
    #return -1

#tri + square + circle = 10
#circle + square - tri = 6
#circle + tri - square = 4

def isValid(P):
    s = Solver()
    s.add(Not(P)) # replace True with required declarative spec
    return (s.check()==unsat)

# Set up and run the function and report its results
hw2()
