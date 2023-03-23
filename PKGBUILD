# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=1.7.1
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
sha256sums_x86_64=('3c265e4ef3b48a7d02ab1e48255bfb524f070292ec9e34232fd486bb6fc126ce')
sha256sums_aarch64=('rad18eae3e263fa1c15b2b75e75c005a94fb22233d8c2edd98eb9fcdc7d94e8b4')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
