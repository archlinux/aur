#!/usr/bin/perl
use v5.10;
use experimental 'smartmatch';
use Tie::File;
use Template;
use LWP::UserAgent;
use Data::Dumper;

use constant {
    SOURCE => "http://www.visual-paradigm.com/downloads/vpce/Visual_Paradigm_CE_Linux64_InstallFree.tar.gz",
    BASE   => 'https://eu7.visual-paradigm.com/visual-paradigm/vpce',
};

sub _get_latest_version {
    my ($ua) = @_;

    my $req = HTTP::Request->new(HEAD => SOURCE);
    my $res = $ua->request($req);
    my $uri;

    if ( $res->is_success ) {
        $uri = $res->base;
        $uri =~ /Visual_Paradigm_CE_([0-9_]{4})_([0-9]{8})_Linux([2-6]{2})_InstallFree.tar.gz/;
        my $info = {
            base => $1,
            date => $2,
        };
        $info->{base} =~ s/_/./g;
        return $info if $info->{base} && $info->{date};
    }
    print "Cannot get response on HEAD request about latest tarball";
    exit 1;
}

sub _get_checksum_lines {
    my ($ua, $version) = @_;
    #HASHSUMS => 'https://eu7.visual-paradigm.com/visual-paradigm/vpce13.2/20160812/checksum.html'
    my $uri = BASE . $version->{base} .'/' . $version->{date} . '/checksum.html';
    my $req = HTTP::Request->new(GET => $uri);
    my $res = $ua->request($req);
    if ( $res->is_success ) {
        my @lines = split '\n', $res->content;

        return @lines;
    }
    print "Cannot get response on GET request about checksum";
    exit 2;
}

my $ua = LWP::UserAgent->new;

my $version = _get_latest_version($ua);
my @lines = _get_checksum_lines($ua, $version);

my @versions = grep { $_ ~~ /Visual_Paradigm_CE[^\s]+Linux[2-6]{2}_InstallFree.tar.gz/ } @lines;

die "Cannot get versions" unless @versions;

my %data = ();

for my $line ( @versions ) {
    $line =~ /_CE_([0-9_]+)_Linux([2-6]{2}).*sha256:\s+([0-9a-f]+).*md5:\s+([0-9a-f]+)/;
    my $info = {
        version => $1,
        arch    => $2,
        sha256  => $3,
        md5     => $4,

    };
    $info->{version} =~ s/_/./g;
    my $arch = $info->{arch} eq 32 ? 'i686' : 'x86_64';
    $data{$arch} = $info;
}
if ( $data{x86_64}->{version} ) {
    my $t = Template->new(RELATIVE => 1);

    $t->process('PKGBUILD.template', $data{x86_64}, 'PKGBUILD') || die $tt->error();
}
