# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f40-backgrounds
pkgver=40.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 40 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('39bae9dbaafea5e26f3c24bc515d184538c5bcc3b4db6fcb5ab7619c059214b9b763978cb9d0651ff672281d2e1f2dc3c76968aa7ccbed7b1fb92a271b9bcbe0')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
