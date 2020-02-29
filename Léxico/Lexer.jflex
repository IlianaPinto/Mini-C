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
string = "String" 
cif = "if"
cwhile = "while"
cfor = "for"
    //commands
printf = "printf"
scanf = "scanf"

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
opcond = "?"

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
    {integer}       {System.out.println("Entero: "+yytext());}
    {character}     {System.out.println("Caracter: "+yytext());}
    {string}        {System.out.println("String: "+yytext());}
    {cfor}          {System.out.println("cicle: "+yytext());}
    {cwhile}        {System.out.println("cicle: "+yytext());}
    {cif}           {System.out.println("condition: "+yytext());}
    {printf}        {System.out.println(yytext());}
    {scanf}         {System.out.println(yytext());}
    //delimiters
    {keyinit}       {System.out.println("Delimeter: " + yytext());}
    {keyfin}        {System.out.println("Delimeter: " + yytext());}
    {parinit}       {System.out.println("Delimeter: " + yytext());}
    {parfin}        {System.out.println("Delimeter: " + yytext());}
    {comma}         {System.out.println("Delimeter: " + yytext());}
    {semicolon}     {System.out.println("Delimeter: " + yytext());}
    {colon}         {System.out.println("Delimeter: " + yytext());}
    //variables
    {numbers}       {System.out.println("Number: "+yytext());}
    {id}            {System.out.println("Id: " + yytext());}
    {n}             {System.out.println("ERROR "+yytext()+" Linea: "+yyline+" Columna: "+yycolumn);}
    {constchar}     {System.out.println("constchar: "+yytext());}
    {conststr}      {yybegin(CONSTSTR);}
    {spaces}        {}
    //operators
    {opmult}        {System.out.println("operador: " + yytext());}
    {opdiv}         {System.out.println("operador: " + yytext());}
    {opsum}         {System.out.println("operador: " + yytext());}
    {opasig}        {System.out.println("operador: " + yytext());}
    {opcomp}        {System.out.println("operador: " + yytext());}
    {opdif}         {System.out.println("operador: " + yytext());}
    {opgra}         {System.out.println("operador: " + yytext());}
    {opless}        {System.out.println("operador: " + yytext());}
    {oplesseq}      {System.out.println("operador: " + yytext());}
    {opgraeq}       {System.out.println("operador: " + yytext());}
    {opcond}        {System.out.println("operador: " + yytext());}

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
