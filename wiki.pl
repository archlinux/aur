#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use MediaWiki::API;

binmode STDOUT, ":utf8";

my $mw = MediaWiki::API->new({ api_url => 'http://en.wikiquote.org/w/api.php' });

# TODO fetch a specific, stable revision
# TODO add series numbers + episode names to the end?
# TODO actually scrape it into an array?

my $page = $mw->get_page( { title => 'Farscape' } );

if ($#ARGV == 0 && $ARGV[0] eq "revision") {
  print $page->{ 'revid' };
  exit;
}

if ($#ARGV > -1) {
  die;
}

$_ = $page->{ '*' };

# remove everything after, and including, the cast section
s/== Cast ==.*$//s;

# create seperators from horizontal rules, {,sub}section boundaries, quotes
s/^\s*<hr.+?\/>\s*$/%/gim;

s/^===.+?===$/%/gm;

s/^==.+?==$/%/gm;

s/^\s*\*\s*$/%/gm;

# remove empty lines
s/\n{2,}/\n/g;

# collapse any multiple occurances of '%'
s/%\n(%\n)+/%\n/g;

# remove everything before, and including, the first '%'
s/.*?%\n//s;

# remove leading colons
s/^://gm;

# collapse bold and italic text.
s/'''(.+?)'''/$1/g;

s/''(.+?)''/$1/g;

# replace wiki links with just the text
s/\[\[(w:.+?\|)?(.+?)\]\]/$2/g;

# remove trailing whitespace
s/\s+$//gm;
# remove preceding whitespace
s/^\s+//gm;
# collapse runs of spaces
s/(\s)\s+/$1/gm;

print;
