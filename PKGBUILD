# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.3.1
pkgrel=1
_pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Without GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
depends=('python')
optdepends=('cuda: GPU plotting and harvesting')
conflicts=('chia' 'chia-cli')
provides=('chia' 'chia-cli')
replaces=('chia-bin-cli')
options=('!strip')
source_x86_64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_amd64.deb")
source_aarch64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_arm64.deb")
sha256sums_x86_64=('1d8546a8f7b1b0692cb6e93f528955b85665c38349381d1f14814497dac1d19c')
sha256sums_aarch64=('dee00386b2cd63d66be2af87cbb5b3feb8d41429daa56bb063c08c6654122465')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
