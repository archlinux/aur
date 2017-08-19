#!/usr/bin/perl

use strict;

local $/;
my $stdin = <STDIN>;

my $regex = qr/<span class="num text-emphasized">\n +(\d+)\n +<\/span>\n +commits/p;

if ( $stdin =~ /$regex/g ) {
	print "$1";
}
