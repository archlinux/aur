# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl-${pkgver}::${_src}_linux_amd64")
source_i686=("driftctl-${pkgver}::${_src}_linux_386")
sha256sums_x86_64=('603b2279b26d4ce3f5d200c924c04df38b24d3ca1ffcd9c62a65f2dbe680fc95')
sha256sums_i686=('b42d0b15d2c9efc50b51c70a6b458d89320436962d73cf2115b36165285ad889')

package() {
	mv driftctl-${pkgver} driftctl
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
