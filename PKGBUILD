# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.31.7
pkgrel=1
_srcname=k9s
_srcver=0.31.7
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://k9scli.io/'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	10a01834fca8a1c6613ae3ed17ce22575e1d2f4ffb1dd344866df533ed2d2539
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	7310ca3d6d8f359457baeda2b0bc62571b7a0e068fe07275a774e7b2a9b54243
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
