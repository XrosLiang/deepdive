a(k int).
b(k int, p text, q text, r int).
c(s text, n int, t text).

# comprehensive
Q("test" :: TEXT, 123, id, unnest(y)) * :- a(id), b(id, x,y,z), c(x || y,10,"foo"), [z>100; !z < 20, z < 50].

# group by
P(y, z, MAX(w)) :- a(x), b(x,y,z,w).

# expressions
A( x + (w * (x + w)) ) :- b(x,y,z,w).

B( func(x + w + x) ) :- b(x,y,z,w).

C( func(func(func(x))) ) :- b(x,y,z,w).

D( func(x * func2(w + x)) + x ) :- b(x,y,z,w).

E( x :: INT) :- b(x,y,z,w).

F( (x :: INT) + (w :: INT) ) :- b(x,y,z,w).

# conditions
G(x) :- b(x,y,z,w), x + w = 100.

H(x) :- b(x,y,z,w), x + w = 100, x > 50.

I(x) :- b(x,y,z,w), [x + w = 100; [x > 50, w < 10]].

J(x) :- b(x,y,z,w), [x + w = 100; !x > 50].

K(x) :- b(x,y,z,w), [x + w = 100, [!x > 50; x = 40]].

# limit
L(x) * | 100 :- b(x, y, z, w).

# modifiers
M(x) :- b(x,y,z,w), EXISTS[c(a,x,b)].

N(x) :- b(x,y,z,w), EXISTS[c(a,x,b), a > "a"].

O(x) :- b(x,y,z,w), EXISTS[c(a,x,b), a(x)].

S(x) :- b(x,y,z,w), OPTIONAL[c(a,x,b)].

T(x) :- b(x,y,z,w), OPTIONAL[c(a,x,b), a > y], a > y.

U(x) :- OPTIONAL[b(x,y,z,w)], OPTIONAL[c(a,x,b)].

W(x) :- a(x), ALL[c(_,y,_), y < x].

# placeholder
V(x) :- c(_,x,_), a(x).

X(x) :- b(x,_,_,z), c(_,x,y).