# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=37
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.6
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('a5c6241785c4053370578cec251aa449c449f18b9832cd3554ae8d3fabd23142ba90dd5756aca3ca2c8f8397cd3fc303ba15f5f35b0bcfc5c07cd87377f3374b')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
