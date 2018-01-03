# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
pkgname=yn-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="an interactive Y/n prompt"
arch=('x86_64')
url="https://github.com/JoshuaRLi/yn"
license=('MIT')
provides=('yn')

source_x86_64=("https://github.com/JoshuaRLi/yn/releases/download/${pkgver}/yn-${pkgver}.tgz")
sha256sums_x86_64=('b8005810cb23d0fdd402e4220ea762c422e9e708b3e2f786faa0fa60429832ff')

package () {
  cd "${srcdir}/yn-${pkgver}"
  install -Dm 755 yn "${pkgdir}/usr/bin/yn"
  install -Dm 644 yn.1.gz "${pkgdir}/usr/share/man/man1/yn.1.gz"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
