# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=yn
pkgver=0.1.0
pkgrel=1
pkgdesc="interactive y/n prompt"
arch=('x86_64')
url="https://github.com/JoshuaRLi/yn"
license=('MIT')

source=("${url}/releases/download/${pkgver}/yn-${pkgver}.tar.gz")
sha512sums=('89106aa5d2b596f93e951196b1db7717e7040aba7b060c509f47b2014f288fad2c7a5a6cadce923be3e1b9fbe5496336d9bf777f9154e49cd2cc0e8303e19978')

package () {
  cd "${srcdir}/yn-${pkgver}"
  make CC='cc' PREFIX="${pkgdir}/usr" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
