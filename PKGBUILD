# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=werf-bin
pkgver=1.1.8.fix20
_pkgver=1.1.8+fix20
pkgrel=1
pkgdesc='GitOps delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache')
provides=('werf')
source=("${pkgname}-${pkgver}::https://dl.bintray.com/flant/werf/v${_pkgver}/werf-linux-amd64-v${_pkgver}")
sha256sums=('70233ab15c21df75b6f49fc4c3afdf95fa1bbf04403d6a19cd620499ee0bd842')

package() {
	install -Dm755 "${srcdir}"/werf-* "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et: