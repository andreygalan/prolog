fac(physics).
fac(math).
fac(chemistry).


usl1(Petr,Serg):-Petr=math,not(Serg=physics).
usl1(Petr,_):-not(Petr=math).

usl2(Roma,Petr):- not(Roma=physics),Petr=math.
usl2(Roma,_):-Roma=physics.

usl3(Serg, Fa2):-not(Serg=math),Fa2=chemistry.
usl3(Serg, _):-Serg=math.

prov(Petr, Serg, Roma):-
    fac(Petr),fac(Serg),fac(Roma),
    not( Petr=Serg),not( Serg=Roma),not( Petr=Roma),
    usl1(Petr, Serg),
    usl2(Roma, Petr),
    usl3(Serg, Roma).
go:-
    prov(_, _, Roma),
    write("Роман - "),write(Roma).
