# Maintainer: Snyk <elie dot charra at snyk dot io>
# Maintainer: Elie <elie dot charra at snyk dot io>
pkgname=driftctl-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/snyk/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('6bd0f400aa717dc44e860c59394901a1256177d06e1eba198ce5adc21aa64d60')
sha256sums_i686=('b4bbeffe76e0b5bd461e5034886dea1256b90e90136b6bdb8f4f89a4fd2ea792')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
