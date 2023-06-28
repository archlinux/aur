# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=1.8.2
pkgrel=1
_pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Without GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
conflicts=('chia' 'chia-cli')
provides=('chia' 'chia-cli')
replaces=('chia-bin-cli')
options=('!strip')
source_x86_64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_amd64.deb")
source_aarch64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_arm64.deb")
sha256sums_x86_64=('3cead565db2929ea8035adb024dd6d5af2ed99a24a69699c876ba4262456a72a')
sha256sums_aarch64=('a873cd0520062047ce7f62f59ac8e10785383d254d193fa74cfd239fe23d1d25')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
