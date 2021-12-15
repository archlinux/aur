# Maintainer: Snyk <elie dot charra at snyk dot io>
# Maintainer: Elie <elie dot charra at snyk dot io>
pkgname=driftctl-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/snyk/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('f744f45bfdd761d8154daeeee841736691b0d491d304547bbfb37c56fc0dd9f8')
sha256sums_i686=('09534f6a3c97234ed01a740ba711a33b4f09d6809cc829d78719d8de9b696e7e')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
