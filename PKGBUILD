# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.7.1
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
source_x86_64=("https://github.com/Chia-Network/chia-blockchain/releases/download/${pkgver//_/-}/chia-blockchain-cli_${pkgver//_/-}-1_amd64.deb")
source_aarch64=("https://github.com/Chia-Network/chia-blockchain/releases/download/${pkgver//_/-}/chia-blockchain-cli_${pkgver//_/-}-1_arm64.deb")
sha256sums_x86_64=('2e6addf80c1c9f10c992a43c9df6209f1fcf3eebceef75873eafac155abcdcba')
sha256sums_aarch64=('4402643891fb23c1add55464d47eb5517e28ed29e889684db2e7f12a2c1fa32b')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
