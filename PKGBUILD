# Maintainer: Cloudskiff <tech at cloudskiff dot com>
# Maintainer: Elie <elie at cloudskiff dot com>
pkgname=driftctl-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Detect, track and alert on infrastructure drift"
arch=(x86_64 i686)
url="https://github.com/cloudskiff/driftctl"
license=(Apache)
provides=('driftctl')
_src="${url}/releases/download/v${pkgver}/driftctl"
source_x86_64=("driftctl::${_src}_linux_amd64")
source_i686=("driftctl::${_src}_linux_386")
sha256sums_x86_64=('e2a93713974c6877513e03a264ed0c0cbc7c200d9da2167e7f0ffb6c9980e2b4')
sha256sums_i686=('2c8f80f1d8546f398cf6f4865591d5ff77bce8457294bd1a297902b2cbacc791')

package() {
    # Test
	install -Dm 0755 driftctl -t "${pkgdir}/usr/bin"
}
