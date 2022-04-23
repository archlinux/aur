# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin-cli'
pkgver=1.3.4
pkgrel=1
_pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Binary Release, Without GUI"
arch=('x86_64' 'aarch64')
url="https://www.chia.net/"
license=('Apache')
conflicts=('chia' 'chia-cli')
provides=('chia' 'chia-cli')
options=('!strip')
source_x86_64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_amd64.deb")
source_aarch64=("https://repo.chia.net/debian/pool/main/c/chia-blockchain-cli/chia-blockchain-cli_${pkgver}-${_pkgrel}_arm64.deb")
sha256sums_x86_64=('df5a6509101bb3ec07035727a68f7c006163a1fdec0619a84f905e6cb374935d')
sha256sums_aarch64=('a1f19604dc4aff61be181a60967c666c91f3bf61ac33692041ce03bb5efb49a7')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
