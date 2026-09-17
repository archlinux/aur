# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>

pkgname=9router
pkgver=0.5.75
pkgrel=1
pkgdesc="FREE AI Router & Token Saver"
arch=(any)
url="https://github.com/decolua/9router"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('77215d441bc3653e3c9c50abd03bb8f2986728c2033ae484d10d154a4f314d7c9a48da5151a2742bccb62442dc46e4e4635b57c2eb94a8e9b98ba64d64b078f1')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s usr/lib/node_modules/9router/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
