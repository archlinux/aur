#!/usr/bin/perl
use v5.10;
use experimental 'smartmatch';
use Tie::File;
use JSON;
use Template;
use LWP::UserAgent;
use Data::Dumper;

use constant {
    SOURCE => "https://ftp.mozilla.org/pub/thunderbird/nightly/latest-comm-aurora/",
    CMD => "bash -c '" . 'source ./PKGBUILD; echo "${pkgver%%.*}"' . "'",
    ARCHES => [ 'i686', 'x86_64' ]
};

sub _get_latest_version {
    my ($ua) = @_;

    my $cmd = CMD();
    my $init = `$cmd`;

    sub _url {
        my ($version) = @_;

        return SOURCE . "thunderbird-$version.0a2.en-US.linux-i686.json";
    }

    my ($req, $res);
    for $i ( $init .. ( $init + 5 ) ) {
        $req = HTTP::Request->new( HEAD => _url($i) );
        $res = $ua->request($req);

        last if $res->is_success;
    }

    exit 2 unless $res->is_success;

    if ( $res->is_success ) {
        my $uri;
        $uri = $res->base;
        print "Uri: $uri";
        $uri =~ /thunderbird-(?<version>[\d]{2}).0a2.en-US.linux-[xi0-9_]*.json/;
        return %+ if %+;
    }

    print "Cannot get response on HEAD request about latest tarball";
    exit 1;
}

sub _fill_metadata {
    my ($ua, $version) = @_;
    # thundebird-50.0a2.en-US.linux-x86_64.tar.bz
    for my $arch ( @{ +ARCHES } ) {
        print "Arch = $arch\n";
        my $file = "thunderbird-$version->{version}.0a2.en-US.linux-$arch";
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
