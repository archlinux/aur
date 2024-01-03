# Maintainer: Simon Banka <simon.banka@gmail.com>
pkgname=k9s-sbanka-bin
pkgver=0.30.6
pkgrel=1
_srcname=k9s
_srcver=0.30.6
pkgdesc="Kubernetes CLI To Manage Your Clusters In Style!"
url='https://github.com/sbanka/k9s'
arch=(x86_64 aarch64)
license=(APACHE)

source_x86_64=(
	"${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_amd64.tar.gz"
)
sha256sums_x86_64=(
	49523dac3c2c679b8c7a77b7afe1fb0ceca10673f565b1ffa6d2e3698bb6378b
)

source_aarch64=(
	"${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/derailed/k9s/releases/download/v${_srcver}/k9s_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
	49872e72054f0751aa3ac316bd55f657784fd06f494fb9977adb0ba1b50b44d7

)

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"
}
