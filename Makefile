MEMBER_IDS = $(shell cat _data/members.yml | grep "^. id: " | sed -r 's/.*: ([a-z]+)/\1/' | tr '\n' ' ')
MEMBER_BIBS = $(addsuffix .bib, $(addprefix _bibliography/, $(MEMBER_IDS)))

BIB_FILE = _bibliography/bibliography.bib

all: build

psi-website.zip:
	JEKYLL_ENV=production jekyll build
	zip -r $@ _site

build: $(BIB_FILE)
	jekyll build

run: _bibliography/bibliography.bib
	jekyll server --watch

$(BIB_FILE): $(MEMBER_BIBS)
	cat $^ | grep -vP "^\s*(url|pdf)\s*=\s*" > $@.tmp
	ruby ./scripts/clean-bibtex.rb -d -u $@.tmp > $@
	rm $@.tmp

clean:
	rm -rf _site .sass-cache .asset-cache psi-website.zip $(BIB_FILE)

.PHONY: all build clean run
