# Maintainer: Kostas Kardaras <kostas.kardaras at gmail dot com>
# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97 at gmail dot com>

pkgname=profile-sync-daemon-brave
pkgver=2025.05.20
pkgrel=1
pkgdesc="Brave browser support for profile-sync-daemon"
arch=('any')
license=('none')
depends=('profile-sync-daemon')
optdepends=(
	'brave: the target browser'
)
source=("brave" "brave-nightly" "brave-beta")
sha256sums=('e974421b81e2e11276071b3364a749e0e01593c8a0689ae24ae5ab0b4ffc25d1'
            '26c9712a9a028e7a24bd975059b9d02e536bc8ea241c7a6f3fa9417c950d5681'
            '8316cc9342afd8f905692d0c69c180cf92a44cb5013050922e6463cd97717821')

package() {
	install -Dm644 brave "${pkgdir}/usr/share/psd/browsers/brave"
	install -Dm644 brave-nightly "${pkgdir}/usr/share/psd/browsers/brave-nightly"
	install -Dm644 brave-beta "${pkgdir}/usr/share/psd/browsers/brave-beta"
}
