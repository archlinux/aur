# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('953d1053b2b3adbc58f249aa01277861f4df25671e99355fce60422d37b55ba7')
sha256sums_i686=('22ecc28a9dca3879505da80f02b64cc642fd229e6b94342e8452cfe1484e9e47')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
