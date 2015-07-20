# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.2
pkgrel=4
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPL3')
depends=('capstone' 'perl')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
sha256sums=('6ec97b21457c0463bd06f3e50fee06d2936c101ba060f7e2d02ea2c1c6d4e506')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}