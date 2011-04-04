WITH Ada.Text_IO; use Ada.Text_IO;

WITH Ada.Integer_Text_IO; use Ada.Integer_Text_Io;

WITH Ada.Numerics.Discrete_Random;


procedure Teste_Pilha2 is

    BUFFER_SIZE: constant := 11;
    type buffer is array(0..(BUFFER_SIZE-1)) of integer;
    type CondicaoPilha is (Vazia, Normal, Cheia);
    
	type Rand_Range is range 0..1000; 

    package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);



    protected type Pilha is
        entry Empilha(item: in integer);
        procedure Desempilha(item: out integer);
		private
        	size_buf: integer := BUFFER_SIZE;
		    buf: buffer;
    	    stack: integer := 0;
    end Pilha;

    protected body Pilha is
		procedure Imprime_Pilha is
		begin
            Put("Pilha:");
            for i in 0..(stack - 1) loop
               Put(buf(i));
            end loop;
            New_line;
		end Imprime_Pilha;
        entry Empilha(item: in integer) when stack < size_buf is
		begin
               buf(stack) := item;
               stack := stack + 1;
               Imprime_Pilha;
               delay 1.0;
        end;
            procedure Desempilha(item: out integer) is
			   	BEGIN
					if stack > 0 then
	                    stack := stack - 1;
                    	item := buf(stack);
					else
						item := -1;
					end if;
                    Imprime_Pilha;
                    delay 1.0;
            end;
    end; -- End task Pilha

    P: Pilha;
	
	
	task type Consumidor;

	task body Consumidor is
	    num : Rand_Range;
    	valor: integer;
		seed : Rand_Int.Generator;
		begin
			loop
	        	Rand_Int.Reset(seed);
            	num := Rand_Int.Random(seed);
	            if (num mod 2) = 1 then
    	            valor := Standard.Integer(num);
                	  P.Empilha(valor);
    	        else
                	   P.Desempilha(valor);
    	        end if;
        	end loop;
		end;

	T1, T2, T3, T4, T5: Consumidor;

    BEGIN
		null;
   END Teste_Pilha2;

