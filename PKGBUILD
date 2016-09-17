# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.6
pkgrel=1
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPL3')
depends=('capstone' 'perl')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
sha256sums=('dd46fc5fc23c3b67025370c2dd4a6be0a071af07c4e515d21aec28003f5aa6ed')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}