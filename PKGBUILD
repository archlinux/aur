# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rare-bin
pkgver=0.1.26
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zix99/rare/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('cd82cf3c41b8424a488ffa63d99eb518af7d750f1cd926e68ed2b4e5a36a99d7')

package() {
  install -Dm755 ${srcdir}/rare "${pkgdir}/usr/bin/rare"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et: