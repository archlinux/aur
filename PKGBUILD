# Maintainer: Snyk <elie dot charra at snyk dot io>
# Maintainer: Elie <elie dot charra at snyk dot io>
pkgname=driftctl-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/snyk/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('f5e7519dd4563fd69fd4dc6af9bc93d59e60ccaaf13c2befd1309679352c09de')
sha256sums_i686=('0eff23359bfdba86f8edb2d99bed39c5b5961f5e39b64c52002cc52b5977d0c8')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
