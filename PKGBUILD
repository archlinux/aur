# Maintainer: Florian Aust <aust.flo at gmail dot com>
# PKGBUILD based on profile-sync-daemon-brave

pkgname=profile-sync-daemon-waterfox
pkgver=2021.12.15
pkgrel=1
pkgdesc="Waterfox browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'waterfox'
	'waterfox-current-bin'
	'waterfox-classic-bin'
	'waterfox-classic-git'
	'waterfox-classic-kpe'
	'waterfox-g3-bin'
	'waterfox-g3-git'
	'waterfox-g3-kpe'
	'waterfox-g4-bin'
	'waterfox-g4-kpe'
)
source=("waterfox")
md5sums=('18f48b44328e738b00a93a0c9524fb57')

package() {
	install -Dm644 waterfox "${pkgdir}/usr/share/psd/browsers/waterfox"
}
