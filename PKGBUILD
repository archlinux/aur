# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f40-backgrounds
pkgver=40.1.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 40 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('c5ae0bf4d98ba356facd4f78ae0f219fd54240453027c4028901d21bf227eb013fa1889e1714a82ffe5168a0c6590ac1e7e45b2935de4d9c7cb77160ef1f5f30')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
