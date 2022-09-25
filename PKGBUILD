# Maintainer: Anonymous <libre-menu-editor@proton.me> 

pkgname=libre-menu-editor
pkgver=1.0
pkgrel=1
pkgdesc='Graphical Interface for managing Application Launchers'
provides=('libre-menu-editor')
license=('GPL3')
depends=('libadwaita' 'gtk4' 'python>=3' 'xdg-utils')
arch=("any")

prepare() {
  cd $(dirname $srcdir)
  tar -xf src.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/usr"
}

