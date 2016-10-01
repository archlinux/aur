#!/usr/bin/perl
use v5.10;
use experimental 'smartmatch';
use Tie::File;
use JSON;
use Template;
use LWP::UserAgent;
use Data::Dumper;

use constant {
    SOURCE => "https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-aurora/",
    LATEST_URL => 'https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux64&lang=en-US',
    ARCHES => [ 'i686', 'x86_64' ]
};

sub _get_latest_version {
    my ($ua) = @_;

    my $req = HTTP::Request->new(HEAD => LATEST_URL);
    my $res = $ua->request($req);
    my $uri;

    if ( $res->is_success ) {
        $uri = $res->base;
        $uri =~ /firefox-(?<version>[\d]{2}).0a2.en-US.linux-[xi0-9_]*.tar.bz/;
        return %+;
    }
    print "Cannot get response on HEAD request about latest tarball";
    exit 1;
}

sub _fill_metadata {
    my ($ua, $version) = @_;
    # firefox-50.0a2.en-US.linux-x86_64.tar.bz
    for my $arch ( @{ +ARCHES } ) {
        print "Arch = $arch\n";
        my $file = "firefox-$version->{version}.0a2.en-US.linux-$arch";
        my $base_uri = SOURCE . $file;
        my $uri = $base_uri . '.checksums';

        my $req = HTTP::Request->new(GET => $uri);
        my $res = $ua->request($req);
        if ( $res->is_success ) {
            my $sum = "sha512sums_$arch";
            $res->content =~ /(?<$sum>[0-9a-f]+) sha512 [\d]+ $file.tar.bz2/m;
            $version->{$sum} = $+{$sum};
        }

        unless ( $version->{buildid} ) {
            $uri = $base_uri . '.json';
            $req = HTTP::Request->new(GET => $uri);
            $res = $ua->request($req);
            if ( $res->is_success ) {
                my $json = decode_json $res->content;
                $version->{buildid} = $json->{buildid};
            }
        }
    }
}

my $ua = LWP::UserAgent->new;

my %version = _get_latest_version($ua);
_fill_metadata($ua, \%version);

my $t = Template->new(RELATIVE => 1);

$t->process('PKGBUILD.template', \%version, 'PKGBUILD') || die $tt->error();
# 
# my @versions = grep { $_ ~~ /Visual_Paradigm_CE[^\s]+Linux[2-6]{2}_InstallFree.tar.gz/ } @lines;
# 
# die "Cannot get versions" unless @versions;
# 
# my %data = ();
# 
# for my $line ( @versions ) {
#     $line =~ /_CE_([0-9_]+)_Linux([2-6]{2}).*sha256:\s+([0-9a-f]+).*md5:\s+([0-9a-f]+)/;
#     my $info = {
#         version => $1,
#         arch    => $2,
#         sha256  => $3,
#         md5     => $4,
# 
#     };
#     $info->{version} =~ s/_/./g;
#     my $arch = $info->{arch} eq 32 ? 'i686' : 'x86_64';
#     $data{$arch} = $info;
# }
# if ( $data{x86_64}->{version} ) {
# }
