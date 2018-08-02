# Makefile
build:
	ocamlbuild -use-ocamlfind -pkg core src/main.d.byte
	#buck build //src:main
clean:
	ocamlbuild -clean
	#buck build //src:main
.PHONY: build clean