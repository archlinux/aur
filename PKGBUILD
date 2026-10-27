# Maintainer: Kostas Kardaras <kostas.kardaras at gmail dot com>

pkgname=profile-sync-daemon-brave-origin
pkgver=2026.10.27
pkgrel=1
pkgdesc="Brave origin browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'brave-origin-bin: the target browser'
)
source=("brave-origin")
md5sums=('dfc6f5ae61cc9e31b956ee104ee6aa38')

package() {
	install -Dm644 brave-origin "${pkgdir}/usr/share/psd/browsers/brave-origin"
}

