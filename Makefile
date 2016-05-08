
all: build

build:
	jekyll build

run:
	jekyll server --watch

clean:
	rm -f *~

.PHONY: clean run
