# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.6.0
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
sha256sums_x86_64=('84562a8efc3556a59daa25a7cd06e4ba75a2a51664093d6b8c9d9bb01b671667')
sha256sums_aarch64=('a3eadedde8a945e25c68bafe121fd6296bd0256e1a2337228a7268fe0bcae507')

package() {
	tar -xf data.tar.zst -C "$pkgdir"
}
