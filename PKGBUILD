# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=1.6.1
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
sha256sums_x86_64=('d77e3bcd02c732752e0d2c83fcf8670a304063af914c7bbbec1c154216739cc0')
sha256sums_aarch64=('844d957e9ea4a43a9f80fc600264961d9d735ea6406ee63202654e2fc98c1ac8')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
