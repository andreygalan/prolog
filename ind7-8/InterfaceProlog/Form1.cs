using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SbsSW.SwiPlCs;
using SbsSW.SwiPlCs.Streams;

namespace InterfaceProlog
{
    public partial class formBD : Form
    {
        public formBD()
        {
            InitializeComponent();
        }
        static int[] ans = new int[7];
        static string[] quest = new string[] {"Есть ли у вашего персонажа механические части тела?",
                                               "Ваш персонаж был обладателем стенда?",
                                               "У персонажа светлые волосы?",
                                                "Ваш персонаж умер от старости?",
                                                  "Ваш персонаж жил в Англии?",
                                                    "Ваш персонаж был вампиром?",
                                                    "Стенд вашего персонажа управляет временем?, "};
        static int it = 0;
        static int itstring = 0;       
        private void formBD_Load(object sender, EventArgs e)
        {
            Environment.SetEnvironmentVariable("SWI_HOME_DIR", @"prolog");
            Environment.SetEnvironmentVariable("Path", @"prolog");
            Environment.SetEnvironmentVariable("Path", @"prolog\bin");
            

            button1.Hide();
            button2.Hide();
            button4.Hide();
            button5.Hide();
            button6.Hide();
            button7.Hide();
            button8.Hide();
            txtcap.Hide();

        }
       static List<string> str = new List<string>();
        private void btnCons_Click(object sender, EventArgs e)
        {
            txtcap.Show();
            PlQuery q = new PlQuery("check(Char,0,1,1,1,1,1,1)");
            foreach (PlTermV s in q.Solutions)
                formBD.str.Add(s[0].ToString().Trim(new Char[] { '[', ']' }));

            if (formBD.str.Count > 0)
            {
                label2.Text = "Ваш персонаж " + formBD.str[0];
                button1.Hide();
                button2.Hide();
                button4.Show();
                button5.Show();
                label1.Hide();
                try
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
                catch
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
            } else {
                label2.Text = "Ваш персонаж не найден. Желаете добавить?";
                    
             }


        }
        private void check()
        {
            formBD.itstring = 0;
            PlQuery q = new PlQuery("check(Char,"+ formBD.ans[0].ToString()+ "," + formBD.ans[1].ToString() + "," + formBD.ans[2].ToString() + "," + formBD.ans[3].ToString() + "," + formBD.ans[4].ToString() + "," + formBD.ans[5].ToString() + "," + formBD.ans[6].ToString() + ")");
            foreach (PlTermV s in q.Solutions)
                formBD.str.Add(s[0].ToString().Trim(new Char[] { '[', ']' }));

            if (formBD.str.Count > 0)
            {
                label2.Text = "Ваш персонаж " + formBD.str[0];
                button1.Hide();
                button2.Hide();
                button4.Show();
                button5.Show();
               
                   
                label1.Hide();
                formBD.itstring++;
                try
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
                catch
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
            }
            else
            {
                label2.Text = "Ваш персонаж не найден. Желаете добавить?";
                button1.Hide();
                button2.Hide();
                button4.Hide();
                button5.Hide();
                button6.Show();
                button7.Show();
            }

        }

        private void formBD_FormClosing(object sender, FormClosingEventArgs e)
        {
            //  PlQuery c = new PlQuery("deleteFacts");
            // c.NextSolution(); 
            PlEngine.PlCleanup();
        }
       

    
       

        private void button1_Click(object sender, EventArgs e)
        {
            if (it < 6)
            {
                formBD.ans[formBD.it] = 1;
                it++;
                if (it < 7) label2.Text = quest[it];
            }
            else
            {
                formBD.ans[formBD.it] = 1;

                check();
            }
        }
       
       

        private void button2_Click(object sender, EventArgs e)
        {
            if (it < 6)
            {
                formBD.ans[formBD.it] = 0;
                it++;
                if (it < 7) label2.Text = quest[it];
            }
            else
            {
                formBD.ans[formBD.it] = 0;
                check();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string[] p = { "-q" };
            PlEngine.Initialize(p);
            PlQuery.PlCall("consult('IZ7.pl')");
            PlQuery c = new PlQuery("startAkinator");
            c.NextSolution();

            it = 0;
            label1.Hide();
            button3.Hide();
            button1.Show();
            button2.Show();
            label2.Show();

            label2.Text = quest[formBD.it];
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (formBD.str.Count > itstring)
            {
                label2.Text = "Ваш персонаж " + formBD.str[formBD.itstring];
                button1.Hide();
                button2.Hide();
                button4.Show();
                button5.Show();
                label1.Hide();
                formBD.itstring++;
                try
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
                catch
                {
                    pictureBox1.Image = Image.FromFile("F:/desktop/Новая папка (14)/aki.png");
                }
            }
            else
            {
                label2.Text = "Ваш персонаж не найден. Желаете добавить?";
                button1.Hide();
                button2.Hide();
                button4.Hide();
                button5.Hide();
                button6.Show();
                button7.Show();
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            label2.Text = "";
            label1.Show();
            label1.Text = "Спасибо за игру!!";
            button3.Text = "Новая игра";
            button3.Show();
            PlEngine.PlCleanup();
            button4.Hide();
            button5.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            label1.Text = "Введите имя";
            label1.Show();
            txtcap.Show();
            label2.Hide();
            button6.Hide();
            button7.Hide();
            button8.Show();

        }

        private void button7_Click(object sender, EventArgs e)
        {
            label2.Text = "";
            label1.Show();
            label1.Text = "Спасибо за игру!!";
            button3.Text = "Новая игра";
            button3.Show();
            PlEngine.PlCleanup();
            button6.Hide();
            button7.Hide();
        }

        private void button8_Click(object sender, EventArgs e)
        {
                     

            using (StreamWriter sw = new StreamWriter("characters.txt", true, System.Text.Encoding.Default))
            {
                sw.WriteLine(txtcap.Text);
                sw.WriteLine(formBD.ans[0].ToString() + " " + formBD.ans[1].ToString() + " " + formBD.ans[2].ToString() + " " + formBD.ans[3].ToString() + " " + formBD.ans[4].ToString() + " " + formBD.ans[5].ToString() + " " + formBD.ans[6].ToString());
            }
            MessageBox.Show("персонаж добавлен");

            label2.Text = "";
            label1.Show();
            label1.Text = "Спасибо за игру!!";
            button3.Text = "Новая игра";
            button3.Show();
            PlEngine.PlCleanup();
            label1.Hide();
            txtcap.Hide();
            
          
            button8.Hide();


        }
    }
}
