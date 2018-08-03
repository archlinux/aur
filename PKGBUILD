# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.1.0
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "npm" "nss")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("969dffecd06babb43f4e85f219e62d192420079b")

package() {
  cd "${srcdir}"
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
}
