# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=rare-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("$url/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('46423944b45a85fc437c27cad420b7ffd9b2efab2a5bb506f50047a26793e4ba')

package() {
  install -Dm755 ${srcdir}/{rare,rare-pcre} -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rare.1.gz -t "$pkgdir/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
