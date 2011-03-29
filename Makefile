ADA=gnatmake

all: teste_pilha.adb
	$(ADA) teste_pilha.adb

clean:
	rm -rf *.ali *.o
