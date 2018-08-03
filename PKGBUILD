# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.1.1
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "npm" "nss")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("b1ff120db9c347b8a23a6aacfe983eac84ebb9f6")

package() {
  cd "${srcdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
}
