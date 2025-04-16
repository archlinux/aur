# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=42
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('ddce1299489f8fc6e22364a4444ea2b38d38ab8794c14f488393bfde947e8b463ba790204aef4fb164acda818e656c8df451c8bd5fc6287758e10f0eb73a484e')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
