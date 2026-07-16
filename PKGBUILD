# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.7.2
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
sha256sums_x86_64=('cbb922ed38ee25bd33eb702bc568c36d04a497ca4c88fc7870d0b94040f286c9')
sha256sums_aarch64=('84a60cac24926d854090ca4b31ce350bd9006cc2ac3d199ad766063e22e470e8')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
