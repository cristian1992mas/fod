program nueve;
uses crt;
const valorAlto=999;
type 
	empleado=RECORD
		departamento:integer;
		division:integer;
		numero_empleado:integer;
		categoria:integer;
		cantidad_horas:integer;
	   end;
	   
valor_de_hora=array [1..15] of real;
archivo=file of empleado;


procedure importar(var a:archivo;var t:text);
	var 
		reg:empleado;
	begin
		reset(t);rewrite(a);
		while not eof(t) do begin
			readln(t,reg.departamento,reg.division,reg.numero_empleado,reg.categoria,reg.cantidad_horas);
			write(a,reg);
		end;
		close(a);close(t);
	end;
	


procedure cargar_arreglo(var arreglo:valor_de_hora;var t:text);
	var
		i:integer;
		valor:real;
	begin
		reset(t);
		for i:=1 to 15 do begin
			readln(t,valor);
			arreglo[i]:=valor;
		end;
		close(t);
	end;
	
procedure listar(var a:archivo;var arreglo:valor_de_hora);
	
	begin
	end;
	
	

var
	fileName:string;
	arch_arreglo,text_arch_empleado:text;
	arch_empleado:archivo;
	arreglo:valor_de_hora;
begin
	Write('Nombre del archivo array: ');readln(fileName);
	assign(arch_arreglo,fileName);
	cargar_arreglo(arreglo,arch_arreglo);
	
	Write('Nombre del archivo empleado txt');readln(fileName);
	assign(text_arch_empleado,fileName);
	assign(arch_empleado,'empleados.bin');
	
	listar(arch_empleado,arreglo);
	
	
	

end.
