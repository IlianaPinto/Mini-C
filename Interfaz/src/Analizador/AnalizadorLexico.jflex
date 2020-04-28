package Analizador;
import java_cup.runtime.*;
import java.util.ArrayList;
%%

%unicode 
%line
%column
%int
%class Lexer
%standalone
%cupsym Sym
%cup
%state COMMENTPAR
%state COMMENTLINE
%state CONSTSTR
%state PRINTF

%{
    String str = "";
    ArrayList<String> errores = new ArrayList();
%}

letter = [a-zA-Z]|"_"
number = [0-9]
id = {letter}({letter}|{number})*
numbers = {number}+
n = {numbers}{id}
conststr = "\"" 
simplemark = "'"
constchar = {simplemark}{anything}{simplemark}
marks = "\\""\""
pfint = "%d"
pfchar = "%c"

anything = [\s]|[\S]


//comments
initcomment = "/*"
finalcomment = "*/"
linecomment = "//"
newline = [\n]
spaces = [ \n\t\r]

//reserved word
integer = "int"
character = "char"
cif = "if"
celse = "else"
cwhile = "while"
cfor = "for"
//cmain = "main"
creturn = "return"
//commands
printf = "printf"
scanf = "scanf"
cvoid = "void"

//arithmetic operators
opsum = "+"|"-"
opinc = "++"|"--"
opmult = "*"
opdiv = "/"
opasig = "="
opamp = "&"
//boolean operators
opcomp = "=="
opdif = "!="
opgra = ">"
opless = "<"
oplesseq = "<="
opgraeq = ">="
opcond = "?"
opand = "&&"
opor = "||"
mod = "%"

//delimiters
keyinit = "{"
keyfin = "}"
parinit = "("
parfin = ")"
comma = ","
semicolon = ";"
colon = ":"

%%
<YYINITIAL>
{
    //comments
    {initcomment}   {System.out.println("initcomment");yybegin(COMMENTPAR);}
    {linecomment}   {System.out.println("linecomment");yybegin(COMMENTLINE);}
    {finalcomment}  {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    //reserved
    {integer}       {System.out.println("Entero: "+yytext()); return new Symbol(Sym.INTEGER, yycolumn, yyline, yytext());}
    {character}     {System.out.println("Caracter: "+yytext());return new Symbol(Sym.CHARACTER, yycolumn, yyline, yytext());}
    {cfor}          {System.out.println("cicle: "+yytext());return new Symbol(Sym.FOR, yycolumn, yyline, yytext());}
    {cwhile}        {System.out.println("cicle: "+yytext());return new Symbol(Sym.WHILE, yycolumn, yyline, yytext());}
    {cif}           {System.out.println("condition: "+yytext());return new Symbol(Sym.IF, yycolumn, yyline, yytext());}
    {celse}         {System.out.println("condition: "+yytext());return new Symbol(Sym.ELSE, yycolumn, yyline, yytext());}
    {printf}        {System.out.println("comando: "+yytext());return new Symbol(Sym.PRINTF, yycolumn, yyline, yytext());}
    {scanf}         {System.out.println("comando: "+yytext());return new Symbol(Sym.SCANF, yycolumn, yyline, yytext());}
   //{cmain}         {System.out.println("reservada: "+yytext());return new Symbol(Sym.MAIN, yycolumn, yyline, yytext());}
    {cvoid}         {System.out.println("reservada: "+yytext());return new Symbol(Sym.VOID, yycolumn, yyline, yytext());}
    {creturn}       {System.out.println("reservada: "+yytext());return new Symbol(Sym.RETURN, yycolumn, yyline, yytext());}
    //delimiters
    {keyinit}       {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.KEYINIT, yycolumn, yyline, yytext());}
    {keyfin}        {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.KEYFIN, yycolumn, yyline, yytext());}
    {parinit}       {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.PARINIT, yycolumn, yyline, yytext());}
    {parfin}        {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.PARFIN, yycolumn, yyline, yytext());}
    {comma}         {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.COMMA, yycolumn, yyline, yytext());}
    {semicolon}     {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.SEMICOLON, yycolumn, yyline, yytext());}
    {colon}         {System.out.println("Delimeter: " + yytext());return new Symbol(Sym.COLON, yycolumn, yyline, yytext());}
    //variables
    {numbers}       {System.out.println("Number: "+yytext());return new Symbol(Sym.NUM, yycolumn, yyline, yytext());}
    {id}            {System.out.println("Id: " + yytext());return new Symbol(Sym.IDE, yycolumn, yyline, yytext());}
    {n}             {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    {constchar}     {System.out.println("constchar: "+yytext());return new Symbol(Sym.CONSTCHAR, yycolumn, yyline, yytext());}
    {conststr}      {str = "";yybegin(CONSTSTR);/*System.out.println("ESTR: "+str);return new Symbol(Sym.CONSTSTR, yycolumn, yyline, str);*/}
    {spaces}        {}
    //operators
    {opmult}        {System.out.println("operador: " + yytext());return new Symbol(Sym.OPMULT, yycolumn, yyline, yytext());}
    {opdiv}         {System.out.println("operador: " + yytext());return new Symbol(Sym.OPDIV, yycolumn, yyline, yytext());}
    {opsum}         {System.out.println("operador: " + yytext());return new Symbol(Sym.OPSUM, yycolumn, yyline, yytext());}
    {opinc}         {System.out.println("operador: " + yytext());return new Symbol(Sym.OPINC, yycolumn, yyline, yytext());}
    {opasig}        {System.out.println("operador: " + yytext());return new Symbol(Sym.OPASIG, yycolumn, yyline, yytext());}
    {opcomp}        {System.out.println("operador: " + yytext());return new Symbol(Sym.OPCOMP, yycolumn, yyline, yytext());}
    {opdif}         {System.out.println("operador: " + yytext());return new Symbol(Sym.OPDIF, yycolumn, yyline, yytext());}
    {opgra}         {System.out.println("operador: " + yytext());return new Symbol(Sym.OPGRA, yycolumn, yyline, yytext());}
    {opless}        {System.out.println("operador: " + yytext());return new Symbol(Sym.OPLESS, yycolumn, yyline, yytext());}
    {oplesseq}      {System.out.println("operador: " + yytext());return new Symbol(Sym.OPLESSEQ, yycolumn, yyline, yytext());}
    {opgraeq}       {System.out.println("operador: " + yytext());return new Symbol(Sym.OPGRAEP, yycolumn, yyline, yytext());}
    {opcond}        {System.out.println("operador: " + yytext());return new Symbol(Sym.OPCOND, yycolumn, yyline, yytext());}
    {opand}         {System.out.println("operador: " + yytext());return new Symbol(Sym.AND, yycolumn, yyline, yytext());}
    {opor}          {System.out.println("operador: " + yytext());return new Symbol(Sym.OR, yycolumn, yyline, yytext());}
    {opamp}         {System.out.println("operador: " + yytext());return new Symbol(Sym.AMP, yycolumn, yyline, yytext());}
    {mod}           {System.out.println("operador: " + yytext());return new Symbol(Sym.MOD, yycolumn, yyline, yytext());}

    .               {
                        System.out.println("ERROR LEXICO "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);
                        String err = "ERROR LEXICO "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn;
                        errores.add(err);
                    }
}

<COMMENTPAR>
{
    {finalcomment}  {yybegin(1);}
    {initcomment}   {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    .               {System.out.println(yytext());}
}

<COMMENTLINE>
{
    {newline}   {yybegin(1);}
    .           {System.out.println(yytext());}
}

<CONSTSTR>
{
    {conststr}      {System.out.println("str = "+str);yybegin(1);return new Symbol(Sym.CONSTSTR, yycolumn, yyline, str);}
    {marks}         {str += yytext().charAt(1);}
    {pfint}         {System.out.println("%d");str += yytext();}
    {pfchar}        {System.out.println("%c");str += yytext();}   
    .               {str += yytext();}
}


