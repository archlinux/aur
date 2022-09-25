# Maintainer: Anonymous <libre-menu-editor@proton.me>

pkgname=libre-menu-editor
pkgver=1.0
pkgrel=1
pkgdesc='Graphical Interface for managing Application Launchers'
provides=('libre-menu-editor')
license=('GPL3')
depends=('libadwaita' 'gtk4' 'python>=3' 'xdg-utils')
arch=("x86_64")

package() {
  tar -xf src.tar.xz
  cp -r "$srcdir/usr" "$pkgdir/usr"
}

