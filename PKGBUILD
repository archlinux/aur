# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=crane-bin
pkgver=2.11.1
pkgrel=2
pkgdesc='Lift containers with ease'
arch=('x86_64')
url="https://www.crane-orchestration.com"
license=('MIT')
provides=('crane')
source=("${pkgname}-${pkgver}::https://github.com/michaelsauter/crane/releases/download/v${pkgver}/crane_linux_amd64"
		'LICENSE::https://raw.githubusercontent.com/michaelsauter/crane/master/LICENSE')
sha256sums=('f82d04703cf95b8a76628936a66ee728e775f0a4d157cae26482bbaa797d2fc0'
			'2aeedce7ad8c94cb7ca12dc52001cbe398c1173bd0ce7f0d596a7c53429ddf28')

package() {
  install -Dm755 "${srcdir}"/crane* "${pkgdir}/usr/bin/crane"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: