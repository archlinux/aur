# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=2.0.1
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
sha256sums_x86_64=('75253d6c702173a1a0417ae449970e89d55ffbe6c20162e5d48cb6c31755b150')
sha256sums_aarch64=('b0cb273db55fc56d051400e21a44866afe150fdc4ebc63812a535af4aa0a9edf')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
