man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).
woman(sveta).
woman(vladina).
woman(zoya).
woman(katrin).
woman(galya).
dite(dimitriy,anatoliy).
dite(dimitriy,galya).
dite(vladina,anatoliy).
dite(vladina,galya).
dite(kirill,sveta).
dite(mefodiy,sveta).
dite(kirill,dimitriy).
dite(mefodiy,dimitriy).
dite(zoya,vlad).
dite(zoya,vladina).
dite(katrin,vlad).
dite(katrin,vladina).


sin(X,Y):-dite(X,Y),man(X).
doch(X,Y):-dite(X,Y),women(X).
brak(X,Y):-dite(Z,X),!,dite(Z,Y),not(X=Y).
brat(X,Y):-dite(Y,Z),dite(X,Z),man(X),not(X=Y).
sestra(X,Y):-dite(Y,Z),dite(X,Z),woman(X),not(X=Y).
tetya(X,Y):-dite(Y,Z),sestra(X,Z).
dadya(X,Y):-dite(Y,Z),brat(X,Z).
vnuki(X,Y):-dite(Z,Y),dite(X,Z).


max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.


fact1(N,X):-fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(I,Y,N,X):-I1 is I+1,Y1 is Y*I1,fact2(I1,Y1,N,X).


fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.


fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,B,N,N,B):-!.
fib2(A,B,I,N,X):- I1 is I+1,C is A+B,fib2(B,C,I1,N,X).

prostoe(2).

pros(X):-prostoe(X),!.
pros(X):-pr(X),asserta(prostoe(X)).
pr(2):-!.
pr(X):-pr1(X,2).
pr1(X,X):-!.
pr1(X,I):-Y is X mod I,Y\=0,I1 is I+1,pr1(X,I1).

n_pr(N,X):-npr(N,N,X).
npr(N,I,I):- Y is N mod I, Y=0, pr(I),!.
npr(N,I,X):- I1 is I-1, npr(N,I1,X).

nod1(N,M,M):-N1 is N mod M,N1=0,!.
nod1(N,M,R):- M1 is N mod M,nod(M,M1,R).

sum(0,0):-!.
sum(X,S):- S1 is X mod 10,P is X div 10,sum(P,U),S is S1+U.

pr_c1(0,0):-!.
pr_c1(A,N):-pr_c(A,N).
pr_c(0,1):-!.
pr_c(X,S):- S1 is X mod 10,P is X div 10,pr_c(P,U),S is S1*U.



pr_sd(A,N):-pr_sd(A,1,N,0).
pr_sd(A,A,N,N):-!.
pr_sd(A,I,N,Sum):-Ost is A mod I, Ost=0,!,S is Sum+I,I1 is I+1,pr_sd(A,I1,N,S).
pr_sd(A,I,N,Sum):-I1 is I+1,pr_sd(A,I1,N,Sum).


euler(A,N):-euler(1,A,0,N).
euler(A,A,N,N):-!.
euler(I,A,Count,N):-nod(I,A,1),!,K is Count+1,I1 is I+1, euler(I1,A,K,N).
euler(I,A,Count,N):-I1 is I+1,euler(I1,A,Count,N).


nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B,nod(B,Ost,C).



pr3_00:-read(N), write(N).

max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.


fact1(N,X):-fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(I,Y,N,X):-I1 is I+1,Y1 is Y*I1,fact2(I1,Y1,N,X).


fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.


fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,B,N,N,B):-!.
fib2(A,B,I,N,X):- I1 is I+1,C is A+B,fib2(B,C,I1,N,X).


pr(2):-!.
pr(X):-pr1(X,2).
pr1(X,X):-!.
pr1(X,I):-Y is X mod I,Y\=0,I1 is I+1,pr1(X,I1).

n_pr(N,X):-npr(N,N,X).
npr(N,I,I):- Y is N mod I, Y=0, pr(I),!.
npr(N,I,X):- I1 is I-1, npr(N,I1,X).

nod1(N,M,M):-N1 is N mod M,N1=0,!.
nod1(N,M,R):- M1 is N mod M,nod(M,M1,R).

sum(0,0):-!.
sum(X,S):- S1 is X mod 10,P is X div 10,sum(P,U),S is S1+U.

el(X,E):-pr(X),E is X-1.
el(X,E):-n_pr(X,N),el1(N,B),Y is X div N,pr(Y),el1(Y,B2),E is B*B2.
el1(X,E):-E is X-1.

pr_c1(0,0):-!.
pr_c1(A,N):-pr_c(A,N).
pr_c(0,1):-!.
pr_c(X,S):- S1 is X mod 10,P is X div 10,pr_c(P,U),S is S1*U.



pr_sd(A,N):-pr_sd(A,1,N,0).
pr_sd(A,A,N,N):-!.
pr_sd(A,I,N,Sum):-Ost is A mod I, Ost=0,!,S is Sum+I,I1 is I+1,pr_sd(A,I1,N,S).
pr_sd(A,I,N,Sum):-I1 is I+1,pr_sd(A,I1,N,Sum).


euler(A,N):-euler(1,A,0,N).
euler(A,A,N,N):-!.
euler(I,A,Count,N):-nod(I,A,1),!,K is Count+1,I1 is I+1, euler(I1,A,K,N).
euler(I,A,Count,N):-I1 is I+1,euler(I1,A,Count,N).


nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B,nod(B,Ost,C).



pr3_0:-read(N),r_list(A,N),w_list(A).
r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

pr3_1:-read(N),r_list(A,N),list_sum(A,S),write(S).
list_sum(A,S):-list_sum(A,S,0).
list_sum([],S,S):-!.
list_sum([H|T],S,Sum):-Sum1 is Sum+H,list_sum(T,S,Sum1).

pr3_2:-read(N),r_list(A,N),num_list(A,E),write(E).
num_list(A,E):-read(N),num_list(A,E,N,1).
num_list([H|_],H,N,N):-!.
num_list([_|T],E,N,N1):-K is N1+1,num_list(T,E,N,K).


pr3_3:-read(N),r_list(A,N),list_min(A,M),write(M).

list_min([H|T],M):-list_min(T,M,H).
list_min([],M,M):-!.
list_min([H|T],M,Min):-H<Min,!,list_min(T,M,H).
list_min([_|T],M,Min):-list_min(T,M,Min).


pr_list(A,Pr):-pr_list(A,Pr,1).
pr_list([],Pr,Pr):-!.
pr_list([H|T],Pr,P):-P1 is P*H,pr_list(T,Pr,P1).

append1([],X,X).
append1([H|T],X,[H|Z]):- append1(T,X,Z).

w_list([H|[]]):-write(H),!.
w_list([H|T]):-write(H),write(", "),w_list(T).

no(P):-P,!,fail.
no(_).

read_word(A):-get0(X),r_w(X,A,[]).
r_w(32,A,A):-!.
r_w(X,A,B):- append(B,[X],B1),get0(X1),r_w(X1,A,B1).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get(X1),r_str(X1,A,B1,N,K1).

pr_lec3_1:-read_str(A,N),write("vsego "),write(N),nl,w_list(A).



pr3_6:-read(N),r_list(A,N),rev(A,R),w_list(R).
rev(A,R):-rev(A,[],R).
rev([],B,B):-!.
rev([H|T],B,R):-rev(T,[H|B],R).


pr3_7:-read(N),r_list(A,N),read(M),N>M,r_list(S,M),subl(S,A).

sub_l([],_):-!.
sub_l([H|Ts],[H|T]):-sub_l(Ts,T).

subl(S,A):-sub_l(S,A),!.
subl(S,[_|T]):-sub_l(S,T).


read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

pr5_1:-	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
		write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

pr5_3:-read_str(A,N),get_words(A,Words,K),uniq_el(Words,Uniq_words),count_elems(Words,Uniq_words,Counts),
max_in_list(Counts,Imax),num_list(Uniq_words,Imax,Word),write_str(Word).


write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_elems(A,[],[]):-!.
count_elems(A,[H|T],[Cur|Tail]):count_el(H,A,Cur,),count_elems(A,T,Tail).

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Cur):-Cur1 is Cur+1, count_el(El,T,Count,Cur1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

max_in_list(A,N):-max_in_list(A,Max,N).
max_in_list([H|T],Max,N):-max_in_list(T,Max,N1),Max>H,N is N1+1,!.
max_in_list([H|_],H,1).


