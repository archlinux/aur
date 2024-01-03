# Maintainer: Simon Banka <simon.banka@gmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.30.8
pkgrel=1
_srcname=k9s
_srcver=0.30.8
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://github.com/sbanka/k9s'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	40752ef7192eefab50e012cc24d521fb615bdd1d517717cffe1dc341378aaf85
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	01d74c0e813f75cf1b6ad89f654098cce0a8f7f39c15022b3e57c456b1d20556
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
