from z3 import *

def sqrt(n):
    sqrtn = Real('sqrtn')
    s = Solver()
    s.add(sqrtn * sqrtn == n) # replace True with required declarative spec
    isSat = s.check()
    if (isSat == sat) :
        return s.model()
    return -1
    
print(sqrt(49))