# Maintainer: Kostas Kardaras <kostas.kardaras at gmail dot com>

pkgname=profile-sync-daemon-brave
pkgver=2022.08.18
pkgrel=1
pkgdesc="Brave browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'brave: the target browser'
)
source=("brave"
	"brave-nightly")
md5sums=('0bc18728f49eea8c56565f4029395224'
         '3aafa55956e2bbbc08cb1e6ab3d6d87e')

package() {
	install -Dm644 brave "${pkgdir}/usr/share/psd/browsers/brave"
	install -Dm644 brave-nightly "${pkgdir}/usr/share/psd/browsers/brave-nightly"
}

