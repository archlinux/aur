# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.7.4
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
sha256sums_x86_64=('4782ff0a1622a7a950c47556357290a81f706151c3113ba1d87d50600f10f5cd')
sha256sums_aarch64=('a366476cf7d73549b835128c872c8883ac965e1422d79a69d1b7762ae0b0b3d2')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
