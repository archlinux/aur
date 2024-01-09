# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.31.2
pkgrel=1
_srcname=k9s
_srcver=0.31.2
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://github.com/sbanka/k9s'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	a523372ede51b2f2e2bc9503311445378c22e0702642c9bcde5e4520786e55b0
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	64769ec05d0278c68cd8fcc800685d9f0604e4c4291d7e86b35b620a6a23746a
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
