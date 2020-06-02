// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

open System
open System.Drawing
open System.IO
open System.Windows.Forms



let Form = new Form(Width= 400, Height = 120, Text = "F# форма") 
let Edit1 = new TextBox(Left=15,Text="") 
let Edit2 = new TextBox(Top=20,Left=15, Text="", Width=300, Height=25) 
let button1 = new Button(Text="тык", Top=50,Left=10, Width=25, Height=25) 
Form.Controls.Add(Edit1) 
Form.Controls.Add(Edit2) 
Form.Controls.Add(button1)

let rec gcd x y =
    if y =0 then x
    else gcd y (x % y)


let getk X Y=
  let d = gcd X Y
  let a =X/d
  let b = Y/d
  (a,b)
let prov (list:(int*int) list) k = 
     let (a,b)=k
     List.exists(fun elem ->elem=(a,b)||elem=(b,a)) list

let pr (list:(int*int) list) k =
  if not(prov list k)||list.IsEmpty then k::list
                                    else list

let rec getlist (list:(int*int) list) a b =
     if (b=0) then list
             else
                  if (a%b=0) then let k=  getk b (a/b)
                                  let newlist =pr list k
                                  getlist newlist a (b-1)
                             else getlist list a (b-1)


let rec write_list (list:(int*int) list)=
    match list with 
    |[] ->  Edit2.AppendText(".")
            
    |h::t -> Edit2.AppendText(h.ToString()+" ")
             write_list t 

button1.Click.Add(fun _ ->  write_list(getlist [] (int(Edit1.Text)) (int(Edit1.Text)/2)))                                                

do Application.Run(Form)