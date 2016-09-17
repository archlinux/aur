# Maintainer: TOSH <tosh@t0x0sh.org>

pkgname=perl-keystone
pkgver=1.0
pkgrel=1
pkgdesc="A Perl binding for the keystone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-keystone"
license=('GPL3')
depends=('keystone' 'perl')
source=("https://github.com/t00sh/perl-keystone/archive/v$pkgver.tar.gz")
sha256sums=('b4be863cc03cdb23af15f3c300e08286a9a743cb5dabd049c38c021cd9ff0ea7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}
