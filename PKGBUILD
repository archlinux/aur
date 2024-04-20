# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f40-backgrounds
pkgver=40.2.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 40 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('cddb7d03070ec67b34d7a3f66a099ad1706bf8214c08d7e5f16308e7d6e879023df43d72f9307619de24228a337867e18391340074645b04331f167714fc7139')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
