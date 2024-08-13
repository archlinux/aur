# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f41-backgrounds
pkgver=41.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 41 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('1b0f48714019566d6796276efd187ba5b0af93bf51b01673aa43e55593972d87e92a3326a2d0892c7fa6e02cd9d217926b485fa238317cbeb93f72bc947d7c29')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
