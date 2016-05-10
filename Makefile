
all: build

psi-website.zip:
	JEKYLL_ENV=production jekyll build
	zip -r $@ _site

build:
	jekyll build

run:
	jekyll server --watch

clean:
	rm -rf _site .sass-cache .asset-cache psi-website.zip

.PHONY: all build clean run
