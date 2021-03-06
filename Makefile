MEMBER_BIBS := $(wildcard _bibliography/members/*.bib)
BIB_FILE = _bibliography/bibliography.bib

all: build
zip: psi-website.zip

psi-website.zip: $(BIB_FILE)
	JEKYLL_ENV=production bundle exec jekyll build
	zip -r $@ _site

build: $(BIB_FILE)
	bundle exec jekyll build

run:
	bundle exec jekyll serve

$(BIB_FILE): $(MEMBER_BIBS)
	cat $^ | grep -vP "^\s*(url|pdf)\s*=\s*" > $@.tmp
	ruby ./scripts/clean-bibtex.rb -d -u $@.tmp > $@
	rm $@.tmp

install:
	bundle install

clean:
	rm -rf _site .sass-cache .asset-cache psi-website.zip $(BIB_FILE)

.PHONY: all build clean install run zip
