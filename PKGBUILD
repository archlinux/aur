# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('eafc562aacf9796f22d1cb7927c79f79f466745ccd676648b28cffeaceb281ad')
sha256sums_i686=('0ce0b4783945710ac0e294a3bfdfc1d68d39caabfa500178da973212bb3359a2')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
