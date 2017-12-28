# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='lollipops'
pkgver=1.3.2
pkgrel=1
pkgdesc="Lollipop-style mutation diagrams for annotating genetic variations"
arch=('any')
url="https://github.com/pbnjay/lollipops"
license=('GPL3')
options=(!emptydirs)
source=("https://github.com/pbnjay/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux64.tar.gz")
md5sums=('c78eb9a5f8658843f41a3080586d00c2')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}-linux64"
  install -Dm655 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
