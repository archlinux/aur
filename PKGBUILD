# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.32.0
pkgrel=1
_srcname=k9s
_srcver=0.32.0
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://k9scli.io/'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	3efa7e95695504d6fe8d12745368d8a908241c4949f631776aded2ddc506c6a6
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	fdaf23ec21cd1dfb722d18bc8f59a9fd4b664242f5087b8c0f0c7138ebaac780
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
