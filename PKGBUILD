# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.32.3
pkgrel=1
_srcname=k9s
_srcver=0.32.3
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://k9scli.io/'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	43583463d312823fd8329b9922a8f9eed31494e58c08477832ebca9bac4217e3
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	0f01e25b735bb6aafbf34d76c0843b228fd16f9ff0d2d7f0383516acdf2d6b66
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
