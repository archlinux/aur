# Maintainer: Konstantin Pospelov <kupospelov@gmail.com>
pkgname=btctl
pkgver=0.1
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
sha256sums=('1f7e772873e5179b026cd7fe4c4ffa0c6816063ea07ea1f7987d42630690f783')

package() {
	install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
