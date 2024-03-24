program cesar;
uses crt;
type vetor = array[1 .. 26] of char;
var frase, aux, a : string;
	l, chave, opcao: longint;
	alfabeto : vetor;

function p_no_alfabeto(aux : char) : longint;
var cont : longint;
begin
	p_no_alfabeto := 0;
	for cont := 1 to 26 do
		if aux = alfabeto[cont] then
			p_no_alfabeto := cont;
end;

function encode_cesar(texto : string ; chave : longint) : string;
var j, pos : longint;
begin
	encode_cesar := texto;
	for j := 1 to length(texto) do
	begin
		pos :=	p_no_alfabeto(texto[j]);	
		if pos <> 0 then
		begin
			if pos+chave > 26 then
				pos := pos - 26;
			encode_cesar[j] := alfabeto[pos+chave];
		end
		else 
			encode_cesar[j] := texto[j];
	end;
end;

function decode_cesar(texto : string ; chave : longint) : string;
var j, pos : longint;
begin
	decode_cesar := texto;
	for j := 1 to length(texto) do
	begin
		pos :=	p_no_alfabeto(texto[j]);	
		if pos <> 0 then
		begin
			if pos <= chave then
				pos := pos + 26;
			decode_cesar[j] := alfabeto[pos-chave];
		end
		else 
			decode_cesar[j] := texto[j];
	end;
end;

function encode_cesar2(texto : string ; chave : longint) : string;
var j, pos : longint;
begin
	encode_cesar2 := texto;
	for j := 1 to length(texto) do
	begin
		chave := (chave + 1) mod 26;	
		pos :=	p_no_alfabeto(texto[j]);	
		if pos <> 0 then
		begin
			if pos + chave > 26 then
		 	   pos := pos - 26;
			encode_cesar2[j] := alfabeto[pos+chave]
		end
		else 
			encode_cesar2[j] := texto[j];
	end;
end;

function decode_cesar2(texto : string ; chave : longint) : string;
var j, pos : longint;
begin
	decode_cesar2 := texto;
	for j := 1 to length(texto) do
	begin
		chave := (chave + 1) mod 26;	
		pos :=	p_no_alfabeto(texto[j]);	
		if pos <> 0 then
		begin
			if pos <= chave then
				pos := pos + 26;
			decode_cesar2[j] := alfabeto[pos-chave];
		end
		else 
			decode_cesar2[j] := texto[j];
	end;
end;

begin
	frase := 'bmfbw: xizi mvbmvlmz zmkczaiw mp xzmkqaw mvbmvlmz zmkczaiw';
	chave := 8;
	for l := 1 to 26 do	
		alfabeto[l] := char(l+96);
	writeln('Frase proposta na aula (chave = 8):  ', frase);
	aux := decode_cesar(frase, chave);
	writeln('Frase descriptografada:              ', aux);
	writeln('Frase recriptografada:               ', encode_cesar(aux, chave));
	aux := encode_cesar2(aux, chave);
	writeln('Frase criptografada com meu método:  ', aux);
	writeln('Frase descriptograda:                ', decode_cesar2(aux, chave));

	writeln;
	write('Deseja entrar no modo de manipulação (Y, n)? ');
	read(a);
	if (a = '') or (a = 'y') or (a = 'Y') then
	begin
		writeln;
		opcao := 10;
		frase := 'frase inicial';
		chave := 10;
		aux := frase;
		writeln;
		while opcao <> 0 do
		begin
			clrscr;
			writeln('Escolha entre as opcoes:');
			writeln('0 -> Sair do programa');
			writeln('1 -> Ler frase');
			writeln('2 -> Ler chave');
			writeln('3 -> Criptografar frase atual com cifra normal');
			writeln('4 -> Descriptografar frase atual com cifra normal');
			writeln('5 -> Criptografar frase atual com cifra melhorada');
			writeln('6 -> Descriptografar frase atual com cifra melhorada');

			writeln;
			writeln('frase atual: ', frase);
			writeln('chave atual: ', chave);
			writeln('mensagem:    ', aux);
			writeln;
	
			write('Entre com a opcao: ');
			readln(opcao);
	
			case opcao of 	
				1: 	begin
						write('Entre com a nova frase: ');
						readln(frase);
					end;
				2:	begin
						writeln('Aceita apenas numeros entre 1-26, caso entrada esteja fora desse intervalo,'); 
						writeln('a nova chave terá o valor entrado mod 26');
						write('Entre com a nova chave:  ');
						readln(chave);
						chave := abs(chave);
						chave := chave mod 26;
					end;
				3:	aux := encode_cesar(frase, chave);
				4:	aux := decode_cesar(aux, chave);
				5:	aux := encode_cesar2(frase, chave);
				6:	aux := decode_cesar2(aux, chave);
			end;
		end;
	end;
end.
