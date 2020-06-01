# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2020
_pkgver_month=06
_pkgver_day=01

pkgname=netmon
pkgver=0.9
pkgrel=1
pkgdesc="Simple console network traffic monitor."
url="https://github.com/mdomlop/$pkgname"
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
md5sums=('aeea37ed5d35b1d118adaf7b47235a3d')
