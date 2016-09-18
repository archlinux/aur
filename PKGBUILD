# Maintainer: TOSH <tosh@t0x0sh.org>

pkgname=perl-keystone
pkgver=1.1
pkgrel=1
pkgdesc="A Perl binding for the keystone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-keystone"
license=('GPL3')
depends=('keystone' 'perl')
source=("https://github.com/t00sh/perl-keystone/archive/v$pkgver.tar.gz")
sha256sums=('b333a598fee4e348a72027724ef09206b8acc4eb022ec807e2e6be23e5fa0418')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}
