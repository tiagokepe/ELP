WITH Ada.Text_IO; use Ada.Text_IO;

WITH Ada.Integer_Text_IO; use Ada.Integer_Text_Io;

WITH Ada.Numerics.Discrete_Random;

procedure Teste_Pilha is

    type buffer is array(0..10) of integer;

    type Rand_Range is range 0..100;
    package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
    seed : Rand_Int.Generator;
    num : Rand_Range;
    valor: integer;
    tam_pilha : integer;

    task type Pilha is
        entry Empilha(item: in integer);
        entry Desempilha(item: out integer);
        entry Tamanho(num: out integer);
    end Pilha;

    task body Pilha is
        size_buf: integer := 11;
        buf: buffer;
        stack: integer := 0;

        begin loop
            select
                when stack < size_buf => accept Empilha(item: in integer)
                do
                    buf(stack) := item;
                    stack := stack + 1;
                    Put("Pilha:");
                    for i in 1..(stack - 1) loop
                        Put(buf(i));
                    end loop;
                    New_line;
                    delay 1.0;
                end;
            or
                when stack > 0 => accept Desempilha(item: out integer)
                do
                    stack := stack - 1;
                    item := buf(stack);
                    Put("Pilha:");
                    for i in 1..(stack - 1) loop
                        Put(buf(i));
                    end loop;
                    New_line;
                    delay 1.0;
                 end;
            or
                when stack >= 0 => accept Tamanho(num: out integer)
                do
                    num := stack;
                end;
            else
                null;
            end select;
        end loop;
    end; -- End task Pilha

    P: Pilha;

    BEGIN
        Rand_Int.Reset(seed);
        loop
            num := Rand_Int.Random(seed);
            if (num mod 2) = 1 then
                valor := Standard.Integer(num);
                P.tamanho(tam_pilha);
                if tam_pilha < 11 then
                  P.Empilha(valor);
                end if;
            else
                P.tamanho(tam_pilha);
                if tam_pilha > 0 then
                   P.Desempilha(valor);
                end if;
            end if;
        end loop;
    END Teste_Pilha;

