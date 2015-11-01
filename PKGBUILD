# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.2.2
pkgrel=1
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPL3')
depends=('capstone' 'perl')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
sha256sums=('475ffa1e199d0d5e39b1bd138bf940c4edcb180ba579b30dabd46b4a5f66573e')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}