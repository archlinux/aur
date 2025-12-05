# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.16.0
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL-3.0')
_github_release_commit_hash="5901ca5"
_github_release_file_name="hledger-flow_Linux_x86_64_v${pkgver}_${_github_release_commit_hash}"
source=(
	"https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/${_github_release_file_name}.tar.gz"
)
sha256sums=(
	"a91be13898ebb7445750969f52bd52c4ac75cb75267f36c635db83e131797a8e"
)

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
}
