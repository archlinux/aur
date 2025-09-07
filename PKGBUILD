# Maintainer: Atarwn <a@qwa.su>

pkgname=tinyfilemanager
pkgver=2.6
pkgrel=1
pkgdesc="Single-file PHP file manager"
arch=('any')
url="https://github.com/prasathmani/${pkgname}"
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d48eac2a3f56f904f5f897c63ff281fa40fd44d3bf153e70c9059b219f9d5db4051d5e087c1ab83a71f2e665d5a09bfd83edab5518d078de416e33474b4f86e0')

package() {
  install -d "${pkgdir}/usr/share/webapps/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tinyfilemanager.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/index.php"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/translation.json" \
    "${pkgdir}/usr/share/webapps/${pkgname}/translation.json"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
