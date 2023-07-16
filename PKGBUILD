# Maintainer: Kristof Vannotten <kristof@vannotten.be>
pkgname=pcd
_pkgname=pcd
pkgver=v0.8.1
pkgrel=1
pkgdesc="cli podcatcher writter in go"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/kvannotten/pcd"

source=(
  https://github.com/kvannotten/pcd/releases/download/$pkgver/pcd_linux_amd64
)

md5sums=(
	'SKIP'
)

package() {
  install -Dm755 "${srcdir}/pcd_linux_amd64" "${pkgdir}/usr/bin/pcd"
}
