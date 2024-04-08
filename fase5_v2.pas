program ordenacao;
uses crt;
type vetor = array[1..100] of longint;
var quadros : vetor;
	tam : byte;
	atribuicoes : longint;
	ai : boolean;

procedure mostra_vetor(v : vetor ; t : byte ; a : boolean);
var i : byte;
begin
	if a = true  then
		for i := 1 to t do
			write(v[i], ' ');
	if a = false then
		for i := t downto 1 do
			write(v[i], ' ');
	writeln;
end;

procedure le_vetor(var v : vetor ; t : byte);
var i : byte;
begin
	for i := 1 to tam do
		read(v[i]);
	writeln;
end;

procedure inicializa(var v : vetor);
begin
	v[1] := 5;
	v[2] := 4;
	v[3] := 3;
	v[4] := 2;
	v[5] := 1;
	v[6] := 10;
	v[7] := 9;
	v[8] := 8;
	v[9] := 7;
	v[10] := 6;
	v[11] := 15;
	v[12] := 14;
	v[13] := 13;
	v[14] := 12;
	v[15] := 11;
end;

function tamanho(v : vetor) : byte;
var i : byte;
begin
	i := 0;
	while v[i+1] <> 0 do
		i := i + 1;
	tamanho := i;
end;

function qual_maior(v : vetor ; t : byte) : longint;
var i : byte;
begin
	qual_maior := 0;
	for i := 1 to tam do
		if v[i] > qual_maior then
			qual_maior := v[i];
end;

function acha_pos_certa(v : vetor ; t : byte ; mao1 : longint) : byte;
var i : byte;
begin
	acha_pos_certa := 1;
	for i := 1 to tam do
		if mao1 > v[i] then
			acha_pos_certa := acha_pos_certa + 1;
end;

function parou_de_trocar(var v : vetor ; t : byte ; mao1, inicio_ciclo : longint) : boolean;
var pos_certa : byte;
	mao2 : longint;
begin
	parou_de_trocar := false;
	while not parou_de_trocar do
	begin
		pos_certa := acha_pos_certa(v, t, mao1);
		mao2 := v[pos_certa];
		v[pos_certa] := mao1;
		atribuicoes := atribuicoes + 1;
		mao1 := mao2;
		if pos_certa = inicio_ciclo then
			parou_de_trocar := true;
	end;
end;

procedure ordena_original(var v : vetor ; t : byte);
var maior, mao1 : longint;
	ciclo : byte;
	pode_passar : boolean;
begin
	maior := qual_maior(v, t)+1;
	ciclo := 1;
	while ciclo <= t do
	begin
		mao1 := v[ciclo];
		pode_passar := false;
		while not pode_passar do
		begin
			v[ciclo] := maior;
			atribuicoes := atribuicoes + 1;
			if parou_de_trocar(v, t, mao1, ciclo) then
				pode_passar := true;
		end;
		ciclo := ciclo + 1;
	end;	
end;

begin
	atribuicoes := 0;
	clrscr;
	ai := true;
	write('Quantos quadros haverão na parede? ');
	readln(tam);
	write('Digite o tamanho dos quadros (aceita somente inteiros): ');
	le_vetor(quadros, tam);
//	inicializa(quadros);
//	tam := tamanho(quadros);
	writeln('Sua parede de quadros a ser organizada ficou assim: ');
	mostra_vetor(quadros, tam, ai);
	ordena_original(quadros, tam);
	ai := false;
	writeln('Sua parede de quadros organizada ficou assim: ');
	mostra_vetor(quadros, tam, ai);
	writeln('este programa necessitou de ', atribuicoes, ' penduradas');
	writeln('o valor de moedas a ser recebido eh ', tam*tam);
	writeln('o lucro, portanto, foi de ', tam*tam - atribuicoes, ' moedas :D');
end.
