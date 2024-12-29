# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=rare-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Fast, realtime regex-extraction, and aggregation into common formats such as histograms, numerical summaries, tables, and more!'
arch=('x86_64')
url="https://github.com/zix99/rare"
license=('GPL3')
provides=('rare')
source=("$url/releases/download/${pkgver}/rare_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('b60e62a8e7a4a463e523efcffc029a86c0026d1fb5f84d59fb13e4064dab3add')

package() {
  install -Dm755 ${srcdir}/{rare,rare-pcre} -t "${pkgdir}/usr/bin"
  install -Dm644 ${srcdir}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 rare.1.gz -t "$pkgdir/usr/share/man/man1"
}
# vim:set ts=2 sw=2 et:
