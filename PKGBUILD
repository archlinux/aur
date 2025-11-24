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
sha256sums=('5e38b6bcf9c22a0a9e43050fb3ab784001d7fb128a7f8776d79ff7780fa83341')

package() {
  install -Dm755 "${srcdir}/${_gitname}/main.py" "${pkgdir}/usr/bin/treex"
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_gitname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_gitname}/treex.conf" "${pkgdir}/usr/share/doc/${pkgname}/treex.conf.example"
}
