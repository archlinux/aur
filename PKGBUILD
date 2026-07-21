# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.16.4
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL-3.0')
depends=('hledger')
options=(!debug)
source=(
	"https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/hledger-flow-linux-x64.tar.gz"
)
sha256sums=(
	"111d9107c80f7bd74a94d7be8392ec3af8be88ffd9e1d4faea8a2ea43925bfa0"
)

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
}
