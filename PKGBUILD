# Maintainer: Simon Banka <simon.banka@protonmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.31.9
pkgrel=1
_srcname=k9s
_srcver=0.31.9
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://k9scli.io/'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	075a588642e35cd68394b8ad0df474423650945ef8a786767b7fbce0a4764fea
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	bced070dd0b4e029070a515b62ba294424a0c6f0416e4fac24b3bc5874554305
)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
