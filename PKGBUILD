# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=perl-capstone
pkgver=0.2
pkgrel=1
pkgdesc="A Perl binding for the capstone-engine library"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/perl-capstone"
license=('GPLv3')
groups=('base-devel')
depends=('capstone')
source=("https://github.com/t00sh/perl-capstone/archive/v$pkgver.tar.gz")
md5sums=('2730e64c2fafd341668d8dc35dc5afbd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    perl Makefile.PL
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}