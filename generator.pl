#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use experimental 'smartmatch';
use Tie::File;
use Template;
use LWP::UserAgent;
use HTML::TreeBuilder;
use List::Util qw(maxstr);

use constant {
    ROOT => 'http://ftp.mozilla.org/pub/firefox/nightly/',
};

sub _find_max {
    my ($tree, $filter) = @_;

    my @values =  map { $_->as_text } $tree->find('a');
    @values    = grep { $_ ~~ $filter } @values if defined $filter;

    unless(@values) {
        die "No values can be extracted.";
    }

    return maxstr @values;
}

sub _get_tree {
    my ($ua, $url) = @_;

    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);

    if ( $res->is_success ) {
        my $tree = HTML::TreeBuilder->new_from_content($res->content);
        return $tree;
    }
    else {
        say "Request $url is failed";
        exit 2;
    }
}

sub _get_part {
    my ($ua, $uri, $filter) = @_;

    return _find_max(_get_tree($ua, $uri), $filter);
}

sub _get_data {
    my ($ua, $locale) = @_;
    $locale //= 'en-US';
    my $uri = ROOT;
    my $is_num = qr/^\d+/;
    my $data = {};

    my $year = _get_part($ua,$uri, $is_num);
    $uri .= $year;
    $year =~ s:/::;
    $data->{year} = $year;

    my $month = _get_part($ua, $uri, $is_num);
    $uri .= $month;
    $month =~ s:/::;
    $data->{month} = $month;

    my $release = _get_part($ua, $uri, qr(aurora-l10n/$));
    $uri .= $release;
    $release =~ /^\d{4}-\d{2}-(?<day>\d+)-(?<hour>\d+)-(?<minute>\d+)-(?<second>\d+)/;
    $data = { %$data, %+ };

    my $package_x86_64;
    eval {
        $package_x86_64  = _get_part($ua, $uri, qr($locale.linux-x86_64.tar.bz2$));
        my $package_x86_64_sums = _get_part($ua, $uri, qr($locale.linux-x86_64.checksums$));
        $data->{sha512sums_x86_64} = _get_hashsum($ua, $uri . $package_x86_64_sums, $package_x86_64);
    };
    $data->{sha512sums_x86_64} //= 'SKIP';

    eval {
        my $package_i686 = _get_part($ua, $uri, qr($locale.linux-i686.tar.bz2$));
        my $package_i686_sums = _get_part($ua, $uri, qr($locale.linux-i686.checksums$));
        $data->{sha512sums_i686} = _get_hashsum($ua, $uri . $package_i686_sums, $package_i686);
    };
    $data->{sha512sums_i686} //= 'SKIP';
    say "Can't get hashsums correctly: $@" if $@;

    $data->{version} = $1 if $package_x86_64 =~ /firefox-(\d+)/;

    return $data;
}

sub _get_hashsum {
    my ($ua, $uri, $file) = @_;

    my $req = HTTP::Request->new(GET => $uri);
    my $res = $ua->request($req);
    if ( $res->is_success ) {
        $res->content =~ /(?<sum>[0-9a-f]+) sha512 [\d]+ $file/m;
        return $+{sum};
    }
}

my $ua = LWP::UserAgent->new;
my $data = _get_data($ua, 'ru');

my $t = Template->new(RELATIVE => 1);

say "Generate PKGBUILD for version $data->{version}...";
$t->process('PKGBUILD.template', $data, 'PKGBUILD') || die $t->error();
