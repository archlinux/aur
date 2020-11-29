# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-menu-data
pkgver=0.0.1
pkgrel=1
pkgdesc="Archivos de definición del menú de la aplicación freedesktop.org para LynxOS o lynx-desktop para Arch"
arch=('any')
url="https://gitlab.com/LynxOS/lmd"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lmd-$pkgver.tar.gz")
md5sums=('528329c7481fccf2bb62513fd05cc52c')

package() {
    cd lmd-$pkgver
    mkdir -p "${pkgdir}/etc/xdg/menus" "${pkgdir}/usr/share/desktop-directories"
    cp src/lmd-$pkgver/lynx-xdg-menu/lynx-applications.menu $pkgdir/etc/xdg/menus
    cp -r src/lmd-$pkgver/lynx-desktop-directories/* $pkgdir/usr/share/desktop-directories
}
