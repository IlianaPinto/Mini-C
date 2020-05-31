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
    {integer}       {return new Symbol(Sym.INTEGER, yycolumn, yyline, yytext());}
    {character}     {return new Symbol(Sym.CHARACTER, yycolumn, yyline, yytext());}
    {cfor}          {return new Symbol(Sym.FOR, yycolumn, yyline, yytext());}
    {cwhile}        {return new Symbol(Sym.WHILE, yycolumn, yyline, yytext());}
    {cif}           {return new Symbol(Sym.IF, yycolumn, yyline, yytext());}
    {celse}         {return new Symbol(Sym.ELSE, yycolumn, yyline, yytext());}
    {printf}        {return new Symbol(Sym.PRINTF, yycolumn, yyline, yytext());}
    {scanf}         {return new Symbol(Sym.SCANF, yycolumn, yyline, yytext());}
    {cvoid}         {return new Symbol(Sym.VOID, yycolumn, yyline, yytext());}
    {creturn}       {return new Symbol(Sym.RETURN, yycolumn, yyline, yytext());}
    //delimiters
    {keyinit}       {return new Symbol(Sym.KEYINIT, yycolumn, yyline, yytext());}
    {keyfin}        {return new Symbol(Sym.KEYFIN, yycolumn, yyline, yytext());}
    {parinit}       {return new Symbol(Sym.PARINIT, yycolumn, yyline, yytext());}
    {parfin}        {return new Symbol(Sym.PARFIN, yycolumn, yyline, yytext());}
    {comma}         {return new Symbol(Sym.COMMA, yycolumn, yyline, yytext());}
    {semicolon}     {return new Symbol(Sym.SEMICOLON, yycolumn, yyline, yytext());}
    {colon}         {return new Symbol(Sym.COLON, yycolumn, yyline, yytext());}
    //variables
    {numbers}       {return new Symbol(Sym.NUM, yycolumn, yyline, yytext());}
    {id}            {return new Symbol(Sym.IDE, yycolumn, yyline, yytext());}
    {n}             {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    {constchar}     {return new Symbol(Sym.CONSTCHAR, yycolumn, yyline, yytext());}
    {conststr}      {str = "";yybegin(CONSTSTR);}
    {spaces}        {}
    //operators
    {opmult}        {return new Symbol(Sym.OPMULT, yycolumn, yyline, yytext());}
    {opdiv}         {return new Symbol(Sym.OPDIV, yycolumn, yyline, yytext());}
    {opsum}         {return new Symbol(Sym.OPSUM, yycolumn, yyline, yytext());}
    {opinc}         {return new Symbol(Sym.OPINC, yycolumn, yyline, yytext());}
    {opasig}        {return new Symbol(Sym.OPASIG, yycolumn, yyline, yytext());}
    {opcomp}        {return new Symbol(Sym.OPCOMP, yycolumn, yyline, yytext());}
    {opdif}         {return new Symbol(Sym.OPDIF, yycolumn, yyline, yytext());}
    {opgra}         {return new Symbol(Sym.OPGRA, yycolumn, yyline, yytext());}
    {opless}        {return new Symbol(Sym.OPLESS, yycolumn, yyline, yytext());}
    {oplesseq}      {return new Symbol(Sym.OPLESSEQ, yycolumn, yyline, yytext());}
    {opgraeq}       {return new Symbol(Sym.OPGRAEP, yycolumn, yyline, yytext());}
    {opcond}        {return new Symbol(Sym.OPCOND, yycolumn, yyline, yytext());}
    {opand}         {return new Symbol(Sym.AND, yycolumn, yyline, yytext());}
    {opor}          {return new Symbol(Sym.OR, yycolumn, yyline, yytext());}
    {opamp}         {return new Symbol(Sym.AMP, yycolumn, yyline, yytext());}
    {mod}           {return new Symbol(Sym.MOD, yycolumn, yyline, yytext());}

    .               {
                        System.out.println("ERROR LEXICO "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);
                        String err = "ERROR LEXICO "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn;
                        errores.add(err);
                    }
}

<COMMENTPAR>
{
    {finalcomment}  {yybegin(1);}
    {initcomment}   {String err = "ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn; errores.add(err);}
    .               {System.out.println(yytext());}
}

<COMMENTLINE>
{
    {newline}   {yybegin(1);}
    .           {System.out.println(yytext());}
}

<CONSTSTR>
{
    {conststr}      {yybegin(1);return new Symbol(Sym.CONSTSTR, yycolumn, yyline, str);}
    {marks}         {str += yytext().charAt(1);}
    {pfint}         {str += yytext();}
    {pfchar}        {str += yytext();}   
    .               {str += yytext();}
}


