%%

%unicode 
%line
%column
%int
%class LEXER
%standalone
%state COMMENTPAR
%state COMMENTLINE
%state CONSTSTR
%state PRINTF

%{
    String str = "";
%}

letter = [a-zA-Z]|"_"
number = [0-9]
id = {letter}({letter}|{number})*
numbers = {number}+
n = {numbers}{id}
conststr = "\"" 
marks = "\\""\""
pfint = "%d"
pfchar = "%c"

toro = [\s]|[\S]


//comments
initcomment = "/*"
finalcomment = "*/"
linecomment = "//"
newline = [\n]
spaces = [ \n\t\r]

//reserved word
integer = "int"
character = "char"
string = "String"
pinteger = "int*"
pcharacter = "char*"

//arithmetic operators
opsum = "+"|"-"
opmult = "*"
opdiv = "/"
opasig = "="

//boolean operators
opcomp = "=="
opdif = "!="
opgra = ">"
opless = "<"
oplesseq = "<="
opgraeq = ">="

//commands
parinit = "("
parfin = ")"
//printf = "printf"{spaces}*{parinit}{toro}*{parfin}

%%
<YYINITIAL>
{
    {initcomment}   {System.out.println("initcomment");yybegin(COMMENTPAR);}
    {linecomment}   {System.out.println("linecomment");yybegin(COMMENTLINE);}
    {finalcomment}  {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    {integer}       {System.out.println("Entero "+yytext());}
    {character}     {System.out.println("Caracter "+yytext());}
    {string}        {System.out.println("String "+yytext());}
    {pinteger}      {System.out.println("Pointer integer "+yytext());}
    {pcharacter}    {System.out.println("Pointer character "+yytext());}
    {numbers}       {System.out.println("Number "+yytext());}
    //{printf}        {System.out.println(yytext());}
    {spaces}        {}
    {id}            {System.out.println("Id " + yytext());}
    {n}             {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    {opmult}        {System.out.println("operador " + yytext());}
    {opdiv}         {System.out.println("operador " + yytext());}
    {opsum}         {System.out.println("operador " + yytext());}
    {opasig}        {System.out.println("operador " + yytext());}
    {opcomp}        {System.out.println("operador " + yytext());}
    {opdif}         {System.out.println("operador " + yytext());}
    {opgra}         {System.out.println("operador " + yytext());}
    {opless}        {System.out.println("operador " + yytext());}
    {oplesseq}      {System.out.println("operador " + yytext());}
    {opgraeq}       {System.out.println("operador " + yytext());}
    {conststr}      {yybegin(CONSTSTR);}
    .               {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
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
    {conststr}      {System.out.println("str = "+str);str = "";yybegin(1);}
    {marks}         {str += yytext().charAt(1);}
    {pfint}         {System.out.println("%d");str += yytext();}
    {pfchar}        {System.out.println("%c");str += yytext();}   
    .               {str += yytext();}
}
