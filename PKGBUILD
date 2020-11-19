# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rare-bin
pkgver=0.1.27
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zix99/rare/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('690fb040f98f921b8ca2c10ab98b76b35ad2969c269317667842acfae25eff77')

package() {
  install -Dm755 ${srcdir}/rare "${pkgdir}/usr/bin/rare"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
