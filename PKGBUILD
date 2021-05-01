# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=profile-sync-daemon-edge
pkgver=2021.5.1
pkgrel=1
pkgdesc="Microsoft Edge support for profile-sync-daemon"
url="https://github.com/graysky2/profile-sync-daemon/issues/279"
arch=('any')
license=('unlicense')
depends=('profile-sync-daemon')
optdepends=(
	'microsoft-edge-beta: the target browser'
	'microsoft-edge-dev: the target browser'
)
source=("microsoft-edge")
md5sums=('19f1f55d59e55334b9c61f12b94f35ee')

package() {
	install -Dm644 microsoft-edge "${pkgdir}/usr/share/psd/browsers/microsoft-edge-beta"
	install -Dm644 microsoft-edge "${pkgdir}/usr/share/psd/browsers/microsoft-edge-dev"
}
