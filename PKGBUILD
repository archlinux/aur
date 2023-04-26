# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=s5cmd-bin
pkgver=2.1.0beta.1
_ver=2.1.0-beta.1
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=('x86_64')
url='https://github.com/peak/s5cmd'
license=('MIT')
provides=()
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${_ver}/${pkgname%-bin}_${_ver}_Linux-64bit.tar.gz")
sha256sums=('de5efa37941ef83e892662aefc936603a1a8acbc5a6a9e003a71721a7140b610')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
