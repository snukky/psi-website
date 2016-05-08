
all: build

build:
	jekyll build

run:
	jekyll server --watch

clean:
	rm -rf _site .sass-cache .asset-cache

.PHONY: clean run
