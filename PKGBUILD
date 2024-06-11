# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=rare-bin
pkgver=0.3.4
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("$url/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('8486bd6da8a3c2a60060613ef34c2662476cf18bdb1b867ecf74b861f886b5e4')

package() {
  install -Dm755 ${srcdir}/{rare,rare-pcre} -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rare.1.gz -t "$pkgdir/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
