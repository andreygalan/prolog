:- dynamic ggstand/2, speed/2, time1/2, control/2, humanoid/2, form/2, imun/2, element/2.

startAkinator:- see('D:/prolog/ind7-8/InterfaceProlog/bin/Debug/characters.txt'),
      readChar, seen.

readChar:- readln(Char),Char \= [],readln(List), assertstart(Char, List),readChar.
readChar:- !.

assertstart(_, []):- !.
assertstart(Character, [H|T]):- asserta(ggstand(Character, H)), assertspeed(Character, T).

assertspeed(_, []):- !.
assertspeed(Character, [H|T]):- asserta(speed(Character, H)), asserttime1(Character, T).

asserttime1(_,[]):- !.
asserttime1(Character,[H|T]):- asserta(time1(Character,H)), assertcontrol(Character, T).

assertcontrol(_, []):- !.
assertcontrol(Character, [H|T]):- asserta(control(Character, H)), asserthumanoid(Character, T).

asserthumanoid(_, []):- !.
asserthumanoid(Character, [H|T]):- asserta(humanoid(Character, H)), assertform(Character, T).

assertform(_, []):- !.
assertform(Character, [H|T]):- asserta(form(Character, H)), assertimun(Character, T).

assertimun(_, []):- !.
assertimun(Character, [H|T]):- asserta(imun(Character, H)), assertelement(Character, T).


assertelement(_, []):- !.
assertelement(Character, [H|_]):- asserta(element(Character, H)).


check(Char,Ans1,Ans2,Ans3,Ans4,Ans5,Ans6,Ans7,Ans8):- ggstand(Char, Ans1), speed(Char, Ans2), time1(Char, Ans3), control(Char, Ans4), humanoid(Char, Ans5), form(Char, Ans6), imun(Char, Ans7),element(Char,Ans8).

checkUsersAnswer(0, List):- write('¬ведите им€ персонажа: '), read_str(CharName), name(Character, CharName), addCharacter(Character, List), !.
checkUsersAnswer(1, _):- !.

delFacts:- deleteggstand, deletespeed, deletetime1, deletecontrol, deletehumanoid, deleteform, deleteimun, deletetime1, deleteelement.

/*-------------------------------”даление фактов------------------------------------*/
deleteggstand:-  repeat,(ggstand(X,Y) -> retract(ggstand(X,Y)), fail;X=nil,Y=nil, !).

deletespeed:- repeat,(speed(X,Y) -> retract(speed(X,Y)), fail;X=nil,Y=nil, !).

deletetime1:- repeat,(time1(X,Y) -> retract(time1(X,Y)), fail;X=nil,Y=nil, !).

deletecontrol:- repeat,(control(X,Y) -> retract(control(X,Y)), fail;X=nil,Y=nil, !).

deletehumanoid:- repeat,(humanoid(X,Y) -> retract(humanoid(X,Y)), fail;X=nil,Y=nil, !).

deleteform:- repeat,(form(X,Y) -> retract(form(X,Y)), fail;X=nil,Y=nil, !).

deleteimun:- repeat,(imun(X,Y) -> retract(imun(X,Y)), fail;X=nil,Y=nil, !).

deleteimun:- repeat,(element(X,Y) -> retract(element(X,Y)), fail;X=nil,Y=nil, !).

addCharacter(CharName, List):-append('D:/prolog/ind7-8/InterfaceProlog/bin/Debug/characters.txt'), nl, write(CharName), nl, write_list(List), told.


write_list([]):-!.
write_list([H|T]):- write(H), write(' '), write_list(T).

write_str([]):-!.
write_str([H|T]):- write(H), write(' '), write_str(T).

read_str(A):-get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).










