# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>

pkgname=9router
pkgver=0.5.59
pkgrel=1
pkgdesc="FREE AI Router & Token Saver"
arch=(any)
url="https://github.com/decolua/9router"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/9router/-/9router-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('6f9669a21d448f1f1759c028a4fbac945d5fd94abc1499c4c23fe0c2f775b4eaf48324cee33620a20fa7c3c3b9225b06ce033c8297ef28dda1cef9624affe3d2')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s usr/lib/node_modules/9router/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
