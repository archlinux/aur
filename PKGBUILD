# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=profile-sync-daemon-edge-stable
pkgver=2024.02.21
pkgrel=1
pkgdesc="Microsoft Edge Stable support for profile-sync-daemon"
url="https://github.com/graysky2/profile-sync-daemon/issues/279"
arch=('any')
license=('unlicense')
depends=('profile-sync-daemon')
optdepends=(
	'microsoft-edge-stable-bin: the target browser'
)
source=("microsoft-edge")
md5sums=('19f1f55d59e55334b9c61f12b94f35ee')

package() {
	install -Dm644 microsoft-edge "${pkgdir}/usr/share/psd/browsers/microsoft-edge"
}
