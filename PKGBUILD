# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('a4c5d2184ab4995b238932db51cf601755d19c9dff85fb12ed0f12e9932f0e72')
sha256sums_i686=('4340fd0bbc06b1f57e0bf9154f560059965b3b0f940d59b17e29a88297fef1f5')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
