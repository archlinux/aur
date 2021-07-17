# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=qtcreator-template-dtk
pkgver=1.1.0
pkgrel=1
pkgdesc="QtCreator Template for DTK"
url="https://github.com/linuxdeepin/qtcreator-template-dtk"
license=('GPL3')
arch=('x86_64')
depends=('qtcreator' 'dtkwidget')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('e79745ac57dc7290c3aed53c9925124be1d60619b18629d6e52d67a5ebf2b89937275f36225de3aa6c20f8fc82ef84a4c81ef24650ea36d5a2a1bd882508847c')

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
