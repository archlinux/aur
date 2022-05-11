# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='chia-bin-cli'
pkgver=1.3.5
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
sha256sums_x86_64=('d3a1fd34babd4576189cd341c3834bc5cee9aeedad3efa3eb60e1fc6e84521cf')
sha256sums_aarch64=('382e921695fdc0c3f9dcbacb8020939add59d00d242bf8f4f597e4f4bdd967f4')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
