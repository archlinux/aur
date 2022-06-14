# Maintainer: mikl_ls  <mikl_ls at protonmail dot com>
pkgname=waydroid-openrc
pkgver=1.2.1
pkgrel=1
pkgdesc="Waydroid Container Manager as an OpenRC service"
arch=('any')
url='https://waydro.id'
license=('GPL3')
depends=('openrc' 'waydroid')
source=("waydroid-container-manager")
sha256sums=("98b4bd1e189b6f19690eca2f725f5f2c922d414292b9b985eb487a00d201d847")

package() {
  install -Dm755 ${srcdir}/waydroid-container-manager "$pkgdir"/etc/init.d/waydroid-container-manager
}