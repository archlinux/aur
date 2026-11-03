# Maintainer: Konstantin Pospelov <kupospelov@gmail.com>
pkgname=btctl
pkgver=0.2
pkgrel=1
pkgdesc='Bluetooth connection manager for fuzzel and other compatible launchers.'
arch=(any)
url='https://codeberg.org/kupospelov/btctl.git'
license=('MIT')
depends=(
	'python-dbus'
)
optdepends=(
	'fuzzel: launcher'
)
source=("https://codeberg.org/kupospelov/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('99015132e38fb966659ae29f434581d9f1b9e2e621dc8d547b2bf6ad2ec4999f')

package() {
	install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
