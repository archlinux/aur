# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.5.4
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
sha256sums_x86_64=('19f26555f58c3ecb524028f397bc1ad30984c721a2a1b908eca24aca56581597')
sha256sums_aarch64=('16c4a8326f04c2bb7107d8c72f8fc7db553a388fc599afd2ac14006b8cff1ea9')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
