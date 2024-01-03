# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=kail-sbanka-bin
pkgver=0.17.3
pkgrel=1
_srcname=kail
_srcver=0.17.3
pkgdesc="Kubernetes log viewer"
url='https://github.com/boz/kail'
arch=(x86_64 aarch64)
license=("MIT")
optdepends=('bash-completion: auto-completion for flux in Bash'
	'zsh-completions: auto-completion for flux in ZSH')

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/boz/kail/releases/download/v${_srcver}/kail_v${_srcver}_linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	49523dac3c2c679b8c7a77b7afe1fb0ceca10673f565b1ffa6d2e3698bb6378b
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/boz/kail/releases/download/v${_srcver}/kail_v${_srcver}_linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	c9e9a8d595dc30f35373d4901d103806308171fe1e562db48632765d4f8099b8
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
