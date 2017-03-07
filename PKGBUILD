# Maintainer: TOSH <tosh@t0x0sh.org>

pkgname=perl-keystone
pkgver=1.2
pkgrel=1
pkgdesc="A Perl binding for the keystone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-keystone"
license=('GPL3')
depends=('keystone' 'perl')
source=("https://github.com/t00sh/perl-keystone/archive/v$pkgver.tar.gz")
sha256sums=('5d81f289cdbc381a9980454117ed11497461763f26b90c4e9d12149dbbedb748')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}
