# Maintainer: Florian Aust <aust.flo at gmail dot com>
# PKGBUILD based on profile-sync-daemon-brave

pkgname=profile-sync-daemon-librewolf
pkgver=2021.12.22
pkgrel=1
pkgdesc="LibreWolf browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'librewolf'
	'librewolf-bin'
)
source=("librewolf")
md5sums=('ea39ab0db834b0f61cc7cb0a92fe71e7')

package() {
	install -Dm644 librewolf "${pkgdir}/usr/share/psd/browsers/librewolf"
}
