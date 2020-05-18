
open System 
open System.Drawing 
open System.IO  
open System.Windows.Forms 
open System

let Form = new Form(Width= 200, Height = 120, Text = "F# Главная форма") 
let Edit1 = new TextBox(Left=15,Text="10") 
let Edit2 = new TextBox(Top=20,Left=15, Text="5") 
let button1 = new Button(Text="+", Top=50,Left=10, Width=25, Height=25) 
let button2 = new Button(Text="-", Top=50, Left=40, Width=25, Height=25) 
let button3 = new Button(Text="*", Top=50, Left=70, Width=25, Height=25) 
let button4 = new Button(Text="/", Top=50, Left=100, Width=25, Height=25) 
Form.Controls.Add(Edit1) 
Form.Controls.Add(Edit2) 
Form.Controls.Add(button1) 
Form.Controls.Add(button2) 
Form.Controls.Add(button3) 
Form.Controls.Add(button4) 
let  Summ _ = 
    MessageBox.Show(string(double(Edit1.Text) + (double(Edit2.Text))), "Сумма") |>ignore
let Minus _ = 
    MessageBox.Show(string(double(Edit1.Text) - (double(Edit2.Text))), "Разность") |>ignore 
let Umnoj _ =
    MessageBox.Show(string(double(Edit1.Text) * (double(Edit2.Text))), "Умножение") |>ignore 
let Del _ = 
    if (double(Edit2.Text)=0.0) then MessageBox.Show("Деление на 0") |>ignore 
    else MessageBox.Show(string(double(Edit1.Text) / (double(Edit2.Text))), "Деление") |>ignore 
let _ =button1.Click.Add(Summ)
let _ =button2.Click.Add(Minus) 
let _ =button3.Click.Add(Umnoj) 
let _ =button4.Click.Add(Del) 
do Application.Run(Form) 

