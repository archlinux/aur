# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.1.7
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "npm" "nss")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("d0fb3ada4ee69fe16784d51366b918482b471c7f")

package() {
  cd "${srcdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
}
