# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=07
_pkgver_day=26

pkgname=cmind
pkgver=0.20
pkgrel=1
pkgdesc='Mastermind®-like console game.'
url='https://github.com/mdomlop/cmind'
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
arch=('i686' 'x86_64')

build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
md5sums=('09f8254db6d1c806bbc8eabc25a80b7a')
