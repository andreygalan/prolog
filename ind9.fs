// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.


let non_del X Y = 
    if X % Y =0   then false
                  else true

let rec pros X Y =
        if X=Y then true
        else (non_del X Y) && (pros X (Y+1))

let pr n = 
    match n with
    | 2 -> true
    | _ -> pros n 2

let min2 x y =
   if x<y then x
   else y


let min3 x y z=
    if x<y then if x<z then x
                else z
    elif y<z then y
    else z

let min4 x y z a=
    if x<y then min3 x z a
    else min3 y z a

let sort2 n2 n3 n1 n0=
    let a2 =min2 n2 n3 
    if a2 = n2 then n3*1000+n2*100+n1*10+n0
    else n2*1000+n3*100+n1*10*n0

let sort3 n1 n2 n3 n0=
    let a1=min3 n1 n2 n3
    if a1=n1 then sort2 n2 n3 n1 n0
    elif a1=n2 then sort2 n1 n3 n2 n0
    else sort2 n1 n2 n3 n0

let sort n=
    let n0=n%10
    let n1=n/10%10
    let n2=n/100%10
    let n3=n/1000
    let a0=min4 n0 n1 n2 n3
    if a0=n0 then sort3 n1 n2 n3 n0
    elif a0=n1 then sort3 n0 n2 n3 n1
    elif a0=n2 then sort3 n0 n1 n3 n2
    else sort3 n0 n1 n2 n3



let rec per a b =
   if sort a=sort b then true
   else false



let prov1 a b c =
    if (pr a)&&(pr b)&&(pr c)&&(per a b)&&(per a c)   then true
    else false
    

    




let prov n = prov1 n (n+3330) (n+6660)

   
let start n=
    let mutable a = n
    while not(prov a) do
        a<-a+1
        if a=1487 then a<-a+1
    (a,a+3330,a+6660)
    




[<EntryPoint>]
let main argv = 
    let n =1486
    let a = start n
    System.Console.Write(a)
    let z=System.Console.ReadKey()
   
    0 // return an integer exit code
