# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=yn
pkgver=0.1.0
pkgrel=1
pkgdesc="interactive y/n prompt"
arch=('x86_64')
url="https://github.com/JoshuaRLi/yn"
license=('MIT')

source=("${url}/releases/download/v${pkgver}/yn-${pkgver}.tar.gz")
sha512sums=('35003a9f7bc5a69b91fa366f636a5f6a42da43c975e323f758b925bdeea575036ae9c2e02a54a669b647af4f4737795225c7b16f00e43fc1bf13ff93ce4bb521')

package () {
  cd "${srcdir}/yn-${pkgver}"
  make CC='cc' PREFIX="${pkgdir}/usr" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
