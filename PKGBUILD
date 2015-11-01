# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.3
pkgrel=1
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPL3')
depends=('capstone' 'perl')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
sha256sums=('d20af32d77ef15b6f6ab263c79a06f9af39309797444ec0cf34506ed0a7159dc')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}