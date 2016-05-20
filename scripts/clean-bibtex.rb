#!/usr/bin/ruby

# TODOs:
# * check and normalize page ranges
# * escape named entities with curly brackets
# * check typographical errors, e.g. trailing spaces, non-TeX dashes, full
#   stops at the end of titles, etc.

require 'trollop'
require 'bibtex'


ACRONYMS = {
  'ACL'   => 'Association for Computational Linguistics',
  'NAACL' => 'North American Chapter of the Association for Computational'\
             ' Linguistics',
  'EMNLP' => 'Empirical Methods on Natural Language Processing',
  'EACL'  => 'European Chapter of the Association for Computational'\
             ' Linguistics',
  'LREC'  => 'The International Conference on Language Resources and'\
             ' Evaluation',
}

STOPWORDS = %w{a about above after again all am an and any are as at
  be because been before being below between both but by
  cannot could
  did do does doing during
  each few for from further
  had has have having he her here hers herself him himself his
  i if in into is it its itself
  me more most my myself
  no nor not
  of off on once only or other ought our ours	ourselves out over own
  same she should so some such
  than that the their theirs them themselves then there these they this those
    through to too
  until up
  very was we were what when where which while who whom why with would
  you your yours yourself yourselves}

DIACRITICS = {
  'ą' => '\k{a}',
  'ć' => "\\'{c}",
  'ę' => '\k{e}',
  'ł' => '\l{}',
  'ń' => "\\'{n}",
  'ó' => "\\'{o}",
  'ś' => "\\'{s}",
  'ź' => "\\'{z}",
  'ż' => '\.{z}',

  'ò' => '\`{o}',
  'ô' => '\^{o}',
  'ö' => '\"{o}',
  'ő' => '\H{o}',
  'õ' => '\~{o}',
  'ō' => '\={o}',
  'ȯ' => '\.{o}',
  'ŏ' => '\u{o}',
  'š' => '\v{s}',

  'ç' => '\c{c}',
  'ụ' => '\d{u}',
  'å' => '\r{a}',
  'ø' => '\o',
}

DIAC_REGEXP = Regexp.new("[#{DIACRITICS.keys.join()}]")

def main()
  opts, bibfile = parse_args()

  warn "Parsing .bibtex..."
  bib = BibTeX.open(bibfile)

  #bib.extend_initials!

  bib.each do |entry|
    expand_acronyms(entry)
    check_keys_existance(entry) if opts[:url]
    escape_diacritics(entry) if opts[:diacs]

    normalize_bibtex_key(entry, :change => opts[:keys])
  end

  warn "Number of entries: #{bib.size}"
  warn "Duplicates: #{bib.duplicates?}"

  bib.sort!{ |a,b| a.author <=> b.author }
  bib.each{ |entry| puts entry }
end


def normalize_bibtex_key(bib, options={})
  author_name = bib.author.first.downcase.gsub(/\\.{|}/, '')
    .split(/[^a-z]+/).first
  first_word = bib.title.downcase.gsub(/\\.{|}/, '')
    .gsub(/[{}\-]/, '').split(/[^a-z]+/)
    .find{ |w| not STOPWORDS.include?(w) }

  suggested_key = "#{author_name}#{bib.year}#{first_word}"
  return if bib.key == suggested_key

  if options[:change]
    warn "Key changed: #{bib.key} => #{suggested_key}"
    bib.key = suggested_key
  else
    warn "Suggested key: #{bib.key} => #{suggested_key}"
  end
end

def expand_acronyms(bib)
  if ACRONYMS.keys.include?(bib.booktitle)
    warn "Expanding :booktitle @ #{bib.key}: #{bib.booktitle}"
    bib.booktitle = ACRONYMS[bib.booktitle]
  end
end

def check_keys_existance(bib, keys=[:url, :keywords])
  keys.each do |key|
    warn "Empty key :#{key} @ #{bib.key}" unless bib.fields.has_key?(key)
  end
end

def escape_diacritics(bib)
  [bib.authors, bib.title, bib.editor, bib.publisher].each do |key|
    key.gsub!(DIAC_REGEXP, DIACRITICS) if key
  end
end

def parse_args()
  opts = Trollop::options do
    version "BibTeX Cleaner 0.0.1"
    banner "Clean and normalize BibTeX files.\n\n"\
      "Usage: #{__FILE__} [options] file.bib\n\n"\
      "Options:"
    opt :keys, "Normalize BibTeX keys"
    opt :names, "Protect named entities"
    opt :diacs, "Escape diacritics"
    opt :url, "Check for URL keyword"
    opt :replace, "Replace the input BibTeX file"
  end
  return opts, ARGV.last
end

if __FILE__ == $0
  main()
end
