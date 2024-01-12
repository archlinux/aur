# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.31.4
pkgrel=1
_srcname=k9s
_srcver=0.31.4
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://github.com/sbanka/k9s'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	3fa1b23a2b9cbce879f153237b0c0ad6407b40a9ec9a6adc3849a3c5360c1de2
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	5aa45965971102d0e8d949d0d4261a767de9fd3e394ad70ea5700a411155de6b
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
