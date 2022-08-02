# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
pkgname=blurry-text-fix
pkgver=2
pkgrel=8
pkgdesc="Fixes blurry text in GTK4 and Flatpak"
license=('GPL3')
provides=('blurry-text-fix')
install=blurry-text-fix.install
arch=('any')
depends=('gtk4')
optdepends=('flatpak')

package() {
  install -Dm644 ../settings.ini "$pkgdir/etc/blurry-text-fix/gtk-4.0/settings.ini"
  install -Dm755 ../blurry-text-fix-reinstall "$pkgdir/usr/bin/blurry-text-fix-reinstall"
  install -Dm755 ../blurry-text-fix-cairo "$pkgdir/usr/bin/blurry-text-fix-cairo"
}
