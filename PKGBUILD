# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.32.4
pkgrel=1
_srcname=k9s
_srcver=0.32.4
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://k9scli.io/'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	d62611d9be2c35b782a765e98421500196acbf8be844cd3d9e32d4fa7846da05
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	adfbe3de1ffd3f119ff27d76d9a493e08adb2536f9b79d08fa245ddb75a5fe52
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
