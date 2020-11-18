# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=crane-bin
pkgver=3.6.0
pkgrel=1
pkgdesc='Lift containers with ease'
arch=('x86_64')
url="https://www.crane-orchestration.com"
license=('MIT')
provides=('crane')
source=("${pkgname}-${pkgver}::https://github.com/michaelsauter/crane/releases/download/v${pkgver}/crane_linux_amd64"
    'LICENSE::https://raw.githubusercontent.com/michaelsauter/crane/master/LICENSE')
sha256sums=('1a5a9f6315d899c5e9a8d5c5d109e8db2e3e74ddb5edb24d2e46a2a0ee994d93'
            '2aeedce7ad8c94cb7ca12dc52001cbe398c1173bd0ce7f0d596a7c53429ddf28')

package() {
  install -Dm755 "${srcdir}"/crane* "${pkgdir}/usr/bin/crane"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
