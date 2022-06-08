# Maintainer: Snyk <elie dot charra at snyk dot io>
# Maintainer: Elie <elie dot charra at snyk dot io>
pkgname=driftctl-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/snyk/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('5c6253f52db3015584eb06c580cf649a07329177ad97eada7315be983ace147e')
sha256sums_i686=('3936b45769b29474d0a596f06dc62b69dc67455d05a6bc325e2e3726fcc1c91d')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
