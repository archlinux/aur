# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=43
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.4
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('2c4562cdeb83541bfa4202d4f47f0d779d3de80edd03785e3cb166ca6a9a414bf12e7d52da7f1ab7d1633df7b1528735d4e8ef352592f81987c30326220a7428')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
