#!/usr/bin/perl
# -*- coding: utf-8, vim: expandtab:ts=4 -*-

# Source: http://www.perl.com/pub/2012/04/perlunicook-standard-preamble.html
use utf8;      # so literals and identifiers can be in UTF-8
use v5.14;     # for locale sorting and unicode_strings
use strict;    # quote strings, declare variables
use warnings;  # on by default
use warnings  qw(FATAL utf8);    # fatalize encoding glitches
use open      qw(:std :utf8);    # undeclared streams in UTF-8
use charnames qw(:full :short);  # unneeded in v5.16

# Decode UTF-8 commandline args
use Encode qw(decode_utf8);
@ARGV = map { decode_utf8($_, 1) } @ARGV;

my $show_help = 0;
my $opt = '';
my $orig = '';
my $repl = '';

if ((scalar(@ARGV) >= 2) and (scalar(@ARGV) <= 3)) {
	my $switch = $ARGV[0];  # Command-line switch, or first pattern

	# -c, -C, --complement  use the complement of SET1
	if ((($switch eq '-c') || ($switch eq '-C') || ($switch eq '--complement')) && (scalar(@ARGV) == 3))	{
		$opt = 'c';
		$orig = $ARGV[1];
		$repl = $ARGV[2];
	}
	# -d, --delete  delete characters in SET1, do not translate
	elsif ((($switch eq '-d') || ($switch eq '--delete')) && (scalar(@ARGV) == 2)) {
		$opt = 'd';
		$orig = $ARGV[1];
		$repl = '';
	}
	# -s, --squeeze-repeats  replace each input sequence of a repeated character that is listed in SET1 with a single occurrence of that character
	elsif (($switch eq '-s') || ($switch eq '--squeeze-repeats')) {   # 2 or 3 argument
		$opt = 's';
		$orig = $ARGV[1];
		$repl = scalar(@ARGV) == 3 ? $ARGV[2] : '';   # If there is a 3rd parameter, then get it else empty string.
	}
    # 2 pattern, default
    elsif (scalar(@ARGV) == 2) {
		$opt = '';
		$orig = $ARGV[0];
		$repl = $ARGV[1];
	}
    else {
        $show_help = 1;   # True
    }
} else {
    $show_help = 1;   # True
}


if ($show_help == 1) {
my $message = <<'END_HELPTEXT';
Usage: tr [OPTION]... SET1 [SET2]
(OPTION must (if there are any) present in the first argument, only one at a
    time (TODO: bundling)!)

This is a tr-like utility in Perl with minimal Unicode support.
(Aid for tr's 'feature': echo "°" | tr "Ű" "ű" -> ±)

Translate, squeeze, and/or delete characters from standard input,
writing to standard output.

  -c, -C, --complement    use the complement of SET1
  -d, --delete            delete characters in SET1, do not translate
  -s, --squeeze-repeats   replace each input sequence of a repeated character
                            that is listed in SET1 with a single occurrence
                            of that character
  -t, --truncate-set1     (NOT IMPLEMENTED) first truncate SET1 to length of
                            SET2
      --help     display this help and exit (This text)
      --version  output version information and exit (NOT IMPLEMENTED)

SETs are specified as strings of characters.  Most represent themselves.
Interpreted sequences are:

  \NNN            character with octal value NNN (1 to 3 octal digits)
  \\              backslash
  \a              audible BEL
  \b              backspace
  \f              form feed
  \n              new line
  \r              return
  \t              horizontal tab
  \v              vertical tab
  CHAR1-CHAR2     all characters from CHAR1 to CHAR2 in ascending order
                  (as in ASCII, TODO: MAKE LOCALE DEPENDENT)

  NOT IMPLEMENTED, TODO:
  [CHAR*]         in SET2, copies of CHAR until length of SET1
  [CHAR*REPEAT]   REPEAT copies of CHAR, REPEAT octal if starting with 0

  Directly not supported:
  [:alnum:]       all letters and digits
  [:alpha:]       all letters
  [:blank:]       all horizontal whitespace
  [:cntrl:]       all control characters
  [:digit:]       all digits
  [:graph:]       all printable characters, not including space
  [:lower:]       all lower case letters
  [:print:]       all printable characters, including space
  [:punct:]       all punctuation characters
  [:space:]       all horizontal or vertical whitespace
  [:upper:]       all upper case letters
  [:xdigit:]      all hexadecimal digits
  [=CHAR=]        all characters which are equivalent to CHAR

Bug reports and patch requests are welcome on the project site!

Excerpt from man tr:

Translation occurs if -d is not given and both SET1 and SET2 appear.
-t may be used only when translating.  SET2 is extended to length of
SET1 by repeating its last character as necessary.  Excess characters
of SET2 are ignored.  Only [:lower:] and [:upper:] are guaranteed to
expand in ascending order; used in SET2 while translating, they may
only be used in pairs to specify case conversion.  -s uses SET1 if not
translating nor deleting; else squeezing uses SET2 and occurs after
translation or deletion.

GNU coreutils home page: <http://www.gnu.org/software/coreutils/>
General help using GNU software: <http://www.gnu.org/gethelp/>
For complete documentation, run: info coreutils 'tr invocation'
END_HELPTEXT
    print(STDERR $message);
    exit;
}

# Custom quoting function
sub quote {
   # The extended patterns should be here
   # ...
   # Escape everything
   my $text = quotemeta;
   # quotemeta is too greedy, remove some escapes
   $text =~ s/\\(-|\\[abfnrtv]|\\[0-7]{3})/$1/gmpu;
   return $text;
}

# Make 'tr operator in a subroutine' as string
my $subtr = sprintf('sub {
	my ( $text ) = @_;
	$text =~ tr/%s/%s/%s;
	return $text;
};', map (quote, $orig, $repl, $opt));

# Check
#print("$subtr\n");

# Make our tr function
my $tr = eval($subtr) or die $@;

# Call tr...
#$out = &$tr($in);

=for explain
Source: http://www.perlmonks.org/?node_id=446029

The eval line above was confusing to me at first (and I'm not even
a total newbie). It may help to see it delimited with more
parenthesis:

eval (sprintf ("tr/%s/%s/", map (quotemeta, $orig, $repl)));


From right to left:

The map uses quotemeta as its EXPR and $orig, $repl as its input list
quotemeta is operating on a local $_

The two variables sprintf is expecting are in the list output from map

eval is evaluating the resulting string made by sprintf. The tr/// is
operating on $_

=cut

# Process each line from STDIN and only STDIN!
foreach my $LINE ( <STDIN> ) {
    print(&$tr($LINE));
}
