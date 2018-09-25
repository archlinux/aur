#!/usr/bin/perl

sub fileencode {
	my ($rv) = @_;
	$rv =~ s/([^-A-Za-z0-9.,&' (){}_])/sprintf("!%2.2X", ord($1))/ge;
	return $rv;
}

print fileencode(@ARGV)
