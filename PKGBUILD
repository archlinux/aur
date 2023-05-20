# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
pkgname=blurry-text-fix
pkgver=3
pkgrel=1
pkgdesc="Fix blurry text in GTK4 and/or Flatpak"
license=('GPL3')
provides=('blurry-text-fix')
install=blurry-text-fix.install
arch=('any')
depends=('gtk4')
optdepends=('flatpak: overwrite flatpak')

package() {
  install -Dm755 ../blurry-text-fix-cairo "$pkgdir/usr/bin/blurry-text-fix-cairo"
}
