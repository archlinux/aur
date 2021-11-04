# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('986b99553431bf9bb015938a07972286b7aa78684c63635bce95605f117314e5')
sha256sums_i686=('700f8c242e7d1efa034df3cadc737415ef1fc28ef27710d6053417a99234335a')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
