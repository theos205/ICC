program cripta_xor;
uses strutils, crt;
var	senha, frase, frasec, volta : string;

function decode_xor(texto, s : string) : string;
var j, v : longint;
begin
	decode_xor := '';
	for j := 0 to length(texto)-1 do
	begin
		v :=  ord(texto[j+1]) xor ord(s[(j mod length(s)) + 1]);
		decode_xor := decode_xor + char(v);
	end;
end;

function encode_xor(texto, s : string) : string;
var j, v : longint;
begin
	encode_xor := '';
	for j := 0 to length(texto)-1 do
	begin
		v := ord(texto[j+1]) xor ord(s[(j mod length(s)) + 1]);
		encode_xor := encode_xor + char(v);
	end;
end;

function rephex(texto : string) : string;
var j : longint;
begin
	rephex := '';
	for j := 1 to length(texto) do
		rephex := rephex + dec2numb(ord(texto[j]), 2, 16);
end;

begin
	clrscr;
	write('Entre com a senha: ');
	readln(senha);
	write('Entre com a frase a ser criptografada: ');
	readln(frase);
	frasec := frase;

	writeln('frase original:             ', frase);
	writeln('frase em hexa:              ', rephex(frase)); 

	frasec := encode_xor(frase, senha);
	writeln('frase criptografada em hex: ', rephex(frasec));

	volta := decode_xor(frasec, senha);
	writeln('frase descriptografada:     ', volta);
	writeln('frase criptografada em ascii: ', frasec, ' ---> nao mostra caracteres nao imprimiveis, como o LF (line feed) que muda de linha');

end.
