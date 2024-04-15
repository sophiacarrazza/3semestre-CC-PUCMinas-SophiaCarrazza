program Fatorial_Recursivo_em_Pascal;

function fatorial (n: integer): integer;
begin
    if(n=0) or (n=1)
        then
            fatorial := 1
        else
            fatorial := n * fatorial(n-1);
end;

var
    num, resultado: integer;

begin
    writeln('Digite um numero para ser feito seu fatorial');
    readln(num);
    resultado := fatorial(num);
    writeln('O resultado do fatorial com o numero ', num, ' é: ', resultado);
end.