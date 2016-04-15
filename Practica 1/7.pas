{
   7.pas
Author= Cristian Steib
   
   
}


program untitled;

uses crt;
type 
	medicamentos= record
		nombre:string;
		presentacion:string;
		vencimiento:Longint;
		stock:integer;
		end;


archivoMedicamentos = file of medicamentos;


procedure importar (var bin:archivoMedicamentos;var txt:text);
	var 
		reg:medicamentos;
	begin
		rewrite(bin);
		reset(txt);
		while (not eof(txt)) do begin
			readln(txt,reg.nombre);
			readln(txt,reg.vencimiento,reg.stock,reg.presentacion);
			write(bin,reg);
		end;
		close(bin);
		close(txt);
	end;
	
	
procedure exportar (var bin:archivoMedicamentos;var txt:text);
			var 
				reg:medicamentos;
			begin	
				reset(bin);
				rewrite(txt);
				while (NOT eof(bin)) do begin
					read(bin,reg);
					writeln(txt, reg.nombre);
					writeln(txt, reg.vencimiento,reg.stock,reg.presentacion)
				end;
				close(bin);
				close(txt);	
			end;
	
procedure listar(var a:archivoMedicamentos);
	{
	* Se listaran los que tengan stock menor a 20
	* }
	var
	reg:medicamentos;
	begin
		reset(a);
		read(a,reg);
		while(not eof(a)) do begin
			if reg.stock<20 then writeln(reg.nombre);
			read(a,reg);
		end;
		close(a);
	end;
	
function coincide_palabra (palabra1:string;palabra2:string):boolean;
	var
		p2:string;
		i:integer;
begin
	p2:='';
	if Length(palabra1)<Length(palabra2) then begin
		for i:=1 to Length(palabra1) do begin
			p2:=p2+palabra2[i];
		end;
		if palabra1=p2 then coincide_palabra:=true else coincide_palabra:=false;
	end
	else if Length(palabra1)=Length(palabra2) then begin
		if palabra1=palabra2 then coincide_palabra:=true else coincide_palabra:=false;
	end;

end;	
	
procedure buscar_listar(var a:archivoMedicamentos);
	{
	*  VERIFICAR SI ES LO QUE SE PIDE 
	* 
	* }
	var
	nombre:string;
	reg:medicamentos;
	begin
		reset(a);
		write('Ingrese comienzo de cadena a buscar');readln(nombre);
		read(a,reg);
		writeln();
		while(not eof(a)) do begin
			if coincide_palabra(nombre,reg.nombre) then 
				writeln(reg.nombre);
			read(a,reg);
		end;
	end;
			
			


var
aBinario:archivoMedicamentos;
aCarga:text;
aMedicamentos:text;
fileName:string;
opcion:byte;

BEGIN
	write('Ingrese nombre del archivo binario: ');readln(fileName);
	assign (aBinario,fileName);	
	assign (aCarga,'carga.txt');
	assign (aMedicamentos,'medicamentos.txt');
	clrscr;
	writeln ('1) Crear archivo binario desde carga.txt'); 
	writeln ('2) Listar medicamentos con stock menor a 20'); 
	writeln ('3) Buscar medicamentos que inicien con cierta palabra'); 
	writeln ('4) Exportar archivo binario medicamentos a medicamentos.txt'); 
	write (' Ingrese opcion: '); readln(opcion);
	writeln();
	case opcion of 
		1:importar (aBinario,aCarga);
		2:listar(aBinario);
		3:buscar_listar(aBinario);
		4:exportar (aBinario,aMedicamentos);
	end;
	
			

	
END.

