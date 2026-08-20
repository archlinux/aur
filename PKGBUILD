# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>

pkgname=9router
pkgver=0.5.55
pkgrel=1
pkgdesc="FREE AI Router & Token Saver"
arch=(any)
url="https://github.com/decolua/9router"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('b26590f250861ea88dee3d6cfc542e889cd779e6f034f9b60795f810ab403a7dd0ae865ef49c0ea7d1f4ae62657363ff975883c1696157a8523256666f52a13d')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s usr/lib/node_modules/9router/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
