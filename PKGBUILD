# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rare-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zix99/rare/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('61fc4c0eea2113c4637608a73b038bfc45c1b291ccb1a7989e70a50170c87dea')

package() {
  install -Dm755 ${srcdir}/rare "${pkgdir}/usr/bin/rare"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
