# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f33-backgrounds
pkgver=33.0.8
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 33 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
replaces=("f33-backgrounds-fedoradesign")
source=("https://github.com/fedoradesign/backgrounds/releases/download/v33.0.8/f33-backgrounds-33.0.8.tar.xz")
b2sums=('7f64108aafccba083bea2e3b56438c29575facccf73ea6a1dbb0a42037b63c3f6a6c3491e76fdd8116af5a6eac8fe7d7cd26955a4ff7b92d2fa6e77400484e09')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
