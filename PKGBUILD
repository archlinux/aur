# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=carafe-bin
_pkgname=carafe
pkgver=1.5.1
pkgrel=1
pkgdesc="Tiny management tool for wine bottles/carafes"
arch=('x86_64')
url="https://github.com/Jelmerro/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/Jelmerro/${_pkgname}/${pkgver}"
license=('GPL3')
depends=('python' 'wine')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.any.pacman")
sha512sums=('78c48ef9ccd1bea4b42a774f73eccad9311efd24a7d3e4b50a8a0346b468d20c725476368b2efe2ab68c5ac268221299117274aa477bf32625200e5367de7601'
            '77f58a0cad340cf6e8ab75db3a16b1d8d4c1d204218908abe379dec81a4f2503b59c04bbd0faa266d3e65bee3efbf3f4404f4cac4f6ad690089c254bb2e71ecd')
sha512sums_x86_64=('52dd751fe799b3a1265af8f01eebd9776103b09e55d270aee5903c705ca858ebfe54b34c9e1cd454c25eaa9f068bacb7452529a51f05f5a6b69ffdff9769c019')

package() {
  cd "$srcdir"

  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
# vim:set ts=2 sw=2 et:
