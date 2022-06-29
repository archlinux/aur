# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-cli-bin'
pkgver=1.4.0
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
sha256sums_x86_64=('8996a937fbcc00467c38ed0180954c7a56ef3e8b9a3975706927b502f1219b341cdb21c5171011e81bb812c0714d1dbe8bb0396e10d0dc0808699cac46428211')
sha256sums_aarch64=('60bf39d184126ddcf01ece2020718b5894baf3ff0126ba29509e01d2a66e57db0a0cfbb655c0ff7ed6ea1a1a8b4241ea59a60fe18e53fa1faaab76433cfbb1da')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
