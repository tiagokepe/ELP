WITH System;
WITH Ada.Text_IO; use Ada.Text_IO;

WITH Ada.Integer_Text_IO; use Ada.Integer_Text_Io;

WITH Ada.Numerics.Discrete_Random;
WITH Ada.Calendar;
WITH GNAT.Semaphores;


procedure Teste_Pilha is

    BUFFER_SIZE: constant := 11;
    type buffer is array(0..(BUFFER_SIZE-1)) of integer;
    type CondicaoPilha is (Vazia, Normal, Cheia);
  --  cond: CondicaoPilha;
    
	type Rand_Range is range 0..100; 

    package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
	seed : Rand_Int.Generator;



    task type Pilha is
        entry Empilha(item: in integer);
        entry Desempilha(item: out integer);
--        entry Status(cond: out CondicaoPilha);
    end Pilha;

    task body Pilha is
		mutex: GNAT.Semaphores.Binary_Semaphore(Initially_Available => True,   Ceiling  => System.Default_Priority);
        size_buf: integer := BUFFER_SIZE;
        buf: buffer;
        stack: integer := 0;

		procedure Imprime_Pilha is
		begin
            Put("Pilha:");
            for i in 0..(stack - 1) loop
               Put(buf(i));
            end loop;
            New_line;
		end Imprime_Pilha;

        begin 
		  loop
            select when stack < size_buf =>     accept Empilha(item: in integer)
				do
					mutex.Seize;
                    buf(stack) := item;
                    stack := stack + 1;
                    Imprime_Pilha;
					mutex.Release;
                    delay 1.0;
                end;
            or when stack > 0 =>        accept Desempilha(item: out integer)
			   	do
					Put_Line("Entrou.");
					mutex.Seize;
                    stack := stack - 1;
                    item := buf(stack);
                    Imprime_Pilha;
					mutex.Release;
                    delay 1.0;
                 end;
  --          or
      --          accept Status(cond: out CondicaoPilha)
    --            do
        --            if stack <= 0 then
		--				cond := Vazia;
		--			elsif stack >= BUFFER_SIZE then
		--				cond := Cheia;
		--			else
		--				cond := Normal;
		--			end if;
          --      end;
            end select;
        end loop;
    end; -- End task Pilha

    P: Pilha;
	
	
	task type Consumidor;

	task body Consumidor is
	    num : Rand_Range;
    	valor: integer;
		begin
			delay 0.1;
	        Rand_Int.Reset(seed);
			loop
				Put_Line("Start");
            	num := Rand_Int.Random(seed);
	            if (num mod 2) = 1 then
    	            valor := Standard.Integer(num);
       -- 	        P.status(cond);
         --   	    if cond /= Cheia then
                	  P.Empilha(valor);
	      --          end if;
    	        else
       -- 	        P.status(cond);
       --     	    if cond /= Vazia then
                	   P.Desempilha(valor);
	     --           end if;
    	        end if;
        	end loop;
		end;

	T1, T2, T3, T4, T5: Consumidor;

    BEGIN
		null;
   END Teste_Pilha;

