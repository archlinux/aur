# Maintainer: Snyk <elie dot charra at snyk dot io>
# Maintainer: Elie <elie dot charra at snyk dot io>
pkgname=driftctl-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/snyk/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('06cd223dce7173f53bcf37345349994c355300dcbc94970c255110de129cace0')
sha256sums_i686=('c8770c6c38701fa57837b6942761265e14853141c9e7931b071a297656aa9699')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
