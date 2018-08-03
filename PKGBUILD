# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.0.1
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("any")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("nodejs" "npm")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("3f0286bd0f4dd32d801c700cad162a3102d20771")

package() {
  cd "${srcdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
}
