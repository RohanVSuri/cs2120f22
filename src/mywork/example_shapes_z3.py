#tri + square + circle = 10
#circle + square - tri = 6
#circle + tri - square = 4

from z3 import *

Triangle = Real("Triange")
Circle = Real("Circle")
Square = Real("Square")

E1 = (Triangle + Square + Circle == 10)
E2 = (Circle + Square - Triangle == 6)
E3 = (Circle + Triangle - Square == 4)

Full = And(E1, E2, E3)

s = Solver()
s.add(Full)

isSat = s.check()
    
# If there's a model/solution return it 
if(isSat == sat):
    print(s.model())
else:
    print(-1)
# otherwise return inconsistent value for error

