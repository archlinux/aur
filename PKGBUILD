# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=43
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('b63cda04b9b9df25d1f686db3ba9e83d850e0e642cd79974ba3f7b3f5da55ad5c6c4a8d2c7c45e59db1a06e65f9640e2091856e13eb12d7b429382b0db746f63')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
