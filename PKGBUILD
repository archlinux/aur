# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.1
pkgrel=1
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/capstone-perl"
license=('GPLv3')
groups=('base-devel')
depends=('capstone')
source=("https://github.com/t00sh/capstone-perl/archive/0.1.tar.gz")
sha256sums=('0ce4273e69bd69b3067b401d419a6427024a75c5c6e0ce3bf11e3476679adbd4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}