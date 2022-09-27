# Maintainer: Anonymous <libre-menu-editor@proton.me>

pkgname=libre-menu-editor
pkgver=1.0
pkgrel=1
pkgdesc='Graphical Interface for managing Application Launchers'
license=('GPL3')
depends=('python>=3' 'gtk4' 'libadwaita' 'xdg-utils')
arch=('any')

source=('https://launchpad.net/libre-menu-editor/stable/1.0/+download/source.tar.xz')
sha256sums=('SKIP')

package() {
  cp -r "$srcdir/usr" "$pkgdir/usr"
}
