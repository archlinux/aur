# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.2
pkgrel=3
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPL3')
depends=('capstone' 'perl')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
sha256sums=('1f23aa1c6088f2b27e3d5782298270c77ad6b1668835286e4fd5a0791ed0263e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}