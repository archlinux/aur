use warnings;
use strict;
use LWP::UserAgent;
use File::Path qw/make_path/;
use Data::Dumper;

=pod

WHATWG.org Local Living HTML Standard

Simon Wilper - 2017-04-09

When cloning the html-build repository from http://github.com/whatwg and
run the `build.sh` you get a clone from the HTML source file that then
gets processed by [WATTSI](https://github.com/whatwg/wattsi).

To my dismay I encountered the style and javascript URLs in the
resulting HTML files to reference remote URLs. Not cool. You have the
possibility to clone the source and have it *locally* but the CSS not?

This script `download-resources.pl` does exactly as it says: Examine the
source file, download the resource files and replace the links with
relative URLs to the `resource` subdirectory.

=cut

my $ua = LWP::UserAgent->new;
my $resources = {};

open( my $fh, '<', "$ARGV[0]" ) || die($!);
open( my $fhOut, '>', "$ARGV[1]" ) || die($!);
mkdir( "resources" );
while( <$fh> ) {
  if ( m@(https://resources.whatwg.org/(.+?))[)"]@ ) {

    my $res_uri = $1;
    my $res_localfile = $2;
    $resources->{$res_uri}++;

    my( $relpath ) = ( $res_localfile =~ m@^(.+)/.+$@ );
    if ( defined($relpath) ) {
      make_path( "resources/$relpath" );
    }

    print( "$res_uri -> resources/$res_localfile\n" );
    $ua->get( $res_uri, ':content_file'=>"resources/$res_localfile" );

    s@https://resources.whatwg.org@resources@;
  }
  print $fhOut $_;
}
close($fh);
close($fhOut);
