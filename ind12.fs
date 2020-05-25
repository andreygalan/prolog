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

let rec powpd x y =
    if(x%y=0)then (1 + (powpd (x/y) y))
    else 0
let ret list =
    list

let rec rep y n list =
    if n =1 then y::list
    else rep y (n-1) (y::list)

let rec pd x y  = 
    
  if(y>1)then  if (x%y = 0)&&(pr y) then y
                                    else  pd x (y-1)
  else 0
    
let rec getlist list a b     =
    
    let y =pd a (b-1)
    if y =0 then list
            else let n = powpd a y
                 let newlist= rep y n list
                 getlist newlist a y
    

let rec start = 
     let a= System.Convert.ToInt32(System.Console.ReadLine())
     getlist [] a a
    
      
let rec write_list (list:int list)=
    match list with 
    |[] ->  let z=System.Console.ReadKey()
            0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t 

[<EntryPoint>]
let main argv = 
     start|>write_list

     let z = System.Console.ReadKey() 
     printfn "%A" argv
     0 // return an integer exit code
