#!/usr/bin/env raku

unit sub MAIN ($ver);

put 'Downloading checksums file.';

my $p := run «wget -q -O -
         "https://rakudo.org/dl/rakudo/rakudo-moar-{$ver}-linux-x86_64-gcc.tar.gz.checksums.txt"»,
         :out;

my $checksum = ~$p.out.lines(:close).first(*.starts-with: 'SHA512').match: /\S+ $/;

my $PKGBUILD_file := 'PKGBUILD'.IO;

my $PKGBUILD = $PKGBUILD_file.slurp;

# Set package version
my Str:D $pkgver = $ver.subst: '-', '_';
$PKGBUILD ~~ s/<?after ^^ 'pkgver='>\N+/$pkgver/;

# Set package checksum
$PKGBUILD ~~ s/<?after ^^ 'sha512sums=(\''> <-[']>+/$checksum/;

put 'Writing to PKGBUILD.';
$PKGBUILD_file.spurt: $PKGBUILD;

put 'Writing to .SRCINFO';
run <makepkg --printsrcinfo>, :out('.SRCINFO'.IO.open: :w);

put 'Running makepkg --install';
run <makepkg --install>;
