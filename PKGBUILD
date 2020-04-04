# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=werf-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='GitOps delivery tool'
arch=('x86_64')
url="https://werf.io"
depends=('docker' 'git')
license=('Apache-2.0')
provides=('werf')
source=("https://dl.bintray.com/flant/werf/v${pkgver}/werf-linux-amd64-v${pkgver}")
md5sums=('6f3c929127ac38629f5a1d4e9420540e')

package() {
	install -Dm755 "${srcdir}"/werf-* "${pkgdir}/usr/bin/werf"
}
# vim:set ts=2 sw=2 et: