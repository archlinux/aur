# Maintainer: Fürst Blumier <aur at furst dot blue>
# Based on profile-sync-daemon-brave and https://github.com/graysky2/profile-sync-daemon/blob/master/contrib/floorp 
pkgname=profile-sync-daemon-floorp
pkgver=2024.10.18
pkgrel=1
pkgdesc="Floorp browser support for profile-sync-daemon"
arch=('any')
url='https://github.com/graysky2/profile-sync-daemon/blob/master/contrib/floorp'
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'floorp: the target browser'
)
source=("floorp")
sha256sums=('65212ed819e483edff062581fc0babdaf2eab718b9153c233a74263af7741d3f')

package() {
	install -Dm644 floorp "${pkgdir}/usr/share/psd/browsers/floorp"
}
