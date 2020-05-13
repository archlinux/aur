# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kondo-bin
pkgver=0.3
pkgrel=1
pkgdesc='Save disk space by cleaning unneeded files from software projects'
arch=('x86_64')
url="https://github.com/tbillington/kondo"
license=('MIT')
provides=('kondo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kondo-x86_64-unknown-linux-gnu.tar.gz"
		'LICENSE::https://github.com/tbillington/kondo/raw/master/LICENSE')
sha256sums=('e26b8cf06aa4a180852d07c1425c298ac3958c68c6fbdf1faadb9955c835223d'
			'86d6e0473685c1e4e43f0bf291ad7a948035d314ea5986f738a53354f7c059e6')

package() {
  install -Dm755 ${srcdir}/kondo "${pkgdir}/usr/bin/kondo"
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: