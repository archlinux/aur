# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2020
_pkgver_month=04
_pkgver_day=03

pkgname=rgbtemp
pkgver=0.2
pkgrel=1
pkgdesc='Change RGB colors according to temperature.'
url='https://github.com/mdomlop/rgbtemp'
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
license=('GPL3')
arch=('i686' 'x86_64')
depends=('msi-rgb')
changelog=ChangeLog

build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make arch_install DESTDIR="$pkgdir"
}
md5sums=('099d476906d4b9a241eac666a722a42d')
