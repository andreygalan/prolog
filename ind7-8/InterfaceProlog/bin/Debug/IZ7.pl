:- dynamic body/2, standus/2, hair/2, dead/2, live/2, vampire/2, time1/2.

startAkinator:- see('D:/prolog/ind7-8/InterfaceProlog/bin/Debug/characters.txt'),
      readChar, seen.

readChar:- readln(Char),Char \= [],readln(List), assertstart(Char, List),readChar.
readChar:- !.

assertstart(_, []):- !.
assertstart(Character, [H|T]):- asserta(body(Character, H)), assertstandus(Character, T).

assertstandus(_, []):- !.
assertstandus(Character, [H|T]):- asserta(standus(Character, H)), asserthair(Character, T).

asserthair(_,[]):- !.
asserthair(Character,[H|T]):- asserta(hair(Character,H)), assertdead(Character, T).

assertdead(_, []):- !.
assertdead(Character, [H|T]):- asserta(dead(Character, H)), assertlive(Character, T).

assertlive(_, []):- !.
assertlive(Character, [H|T]):- asserta(live(Character, H)), assertvampire(Character, T).

assertvampire(_, []):- !.
assertvampire(Character, [H|T]):- asserta(vampire(Character, H)), asserttime1(Character, T).

asserttime1(_, []):- !.
asserttime1(Character, [H|_]):- asserta(time1(Character, H)).


check(Char,Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7):- body(Char, Ans1), standus(Char, Ans2), hair(Char, Ans3), dead(Char, Ans4), live(Char, Ans5), vampire(Char, Ans6), time1(Char, Ans7).

checkUsersAnswer(0, List):- write('¬ведите им€ персонажа: '), read_str(CharName), name(Character, CharName), addCharacter(Character, List), !.
checkUsersAnswer(1, _):- !.

delFacts:- deletebody, deletestandus, deletehair, deletedead, deletelive, deletelive, deletevampire, deletetime1.

/*-------------------------------”даление фактов------------------------------------*/
deletebody:-  repeat,(body(X,Y) -> retract(body(X,Y)), fail;X=nil,Y=nil, !).

deletestandus:- repeat,(standus(X,Y) -> retract(standus(X,Y)), fail;X=nil,Y=nil, !).

deletehair:- repeat,(hair(X,Y) -> retract(hair(X,Y)), fail;X=nil,Y=nil, !).

deletedead:- repeat,(dead(X,Y) -> retract(dead(X,Y)), fail;X=nil,Y=nil, !).

deletelive:- repeat,(live(X,Y) -> retract(live(X,Y)), fail;X=nil,Y=nil, !).

deletevampire:- repeat,(vampire(X,Y) -> retract(vampire(X,Y)), fail;X=nil,Y=nil, !).

deletetime1:- repeat,(time1(X,Y) -> retract(time1(X,Y)), fail;X=nil,Y=nil, !).


addCharacter(CharName, List):-append('D:/prolog/ind7-8/InterfaceProlog/bin/Debug/characters.txt'), nl, write(CharName), nl, write_list(List), told.


write_list([]):-!.
write_list([H|T]):- write(H), write(' '), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write(' '), write_str(T).

read_str(A):-get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).










