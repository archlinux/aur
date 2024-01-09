# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.31.1
pkgrel=1
_srcname=k9s
_srcver=0.31.1
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://github.com/sbanka/k9s'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	8f90f9ab61fb3d2d9ce8b69373570f6983a828f2de26d822ffe9c6cc890ba0bb
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	350fd8373620fb48d92bda72a20b5329d6fa17d069063e02c45a5f6127584369
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
