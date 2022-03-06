# Maintainer: Kostas Kardaras <kostas.kardaras at gmail dot com>

pkgname=profile-sync-daemon-brave
pkgver=2022.03.01
pkgrel=1
pkgdesc="Brave browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'brave: the target browser'
)
source=("brave")
md5sums=('0bc18728f49eea8c56565f4029395224')

package() {
	install -Dm644 brave "${pkgdir}/usr/share/psd/browsers/brave"
}

