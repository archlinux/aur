pkgname=treex
pkgver=1.0.0
pkgrel=1
pkgdesc="TreeX - directory lister with color and summary features"
arch=('any')
url="https://github.com/herdem09/treex"
license=('MIT')
depends=('python')
_gitname="${pkgname}-main"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/main.tar.gz")
sha256sums=('cc49e55b6d18eda54fd5a8962a32263fab94102e33491eed9726dba6218baa1a')

package() {
  install -Dm755 "${srcdir}/${_gitname}/main.py" "${pkgdir}/usr/bin/treex"
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_gitname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_gitname}/treex.conf" "${pkgdir}/usr/share/doc/${pkgname}/treex.conf.example"
}
