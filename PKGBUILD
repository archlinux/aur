# Maintainer: Giulio Girardi <felixonmars at archlinux.org>

pkgname=cinnamon-remove-application
pkgver=0.0.1
pkgrel=0
pkgdesc="Arch linux version of cinnamon-remove-application (enables the uninstall option in the right click Cinnamon application menu)"
arch=('any')
url="https://github.com/rapgenic/cinnamon-remove-application"
license=('GPL2')
source=("https://github.com/rapgenic/cinnamon-remove-application.git")
md5sums=('SKIP')
depends=('gtk3' 'pkgfile' 'pacman' 'cinnamon')

package() {
  install -Dm0755 "$srcdir/cinnamon-remove-application/usr/bin/cinnamon-remove-application" "$pkgdir/usr/bin/cinnamon-remove-application"
}
