# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.16.2
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL-3.0')
options=(!debug)
source=(
	"https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/hledger-flow-linux-x64.tar.gz"
)
sha256sums=(
	"21242f2c39ff8a57d4144bc3d97776edf532824ae9ce1cc025773867f1168b52"
)

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
}
