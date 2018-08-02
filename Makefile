# Makefile
build:
	buck build //src:main
clean:
	buck build //src:main
.PHONY: build clean