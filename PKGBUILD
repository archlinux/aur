pkgname=eclipse-i18n-fr
pkgver=4.4.0
pkgbuild=v20140623020002
pkgrel=1
pkgdesc="French language for eclipse IDE"
url="http://babel.eclipse.org"
arch=('any')
license=('EPL')
depends=('eclipse')
makedepends=('unzip')
source=("http://download.eclipse.org/technology/babel/babel_language_packs/R0.12.0/luna/BabelLanguagePack-eclipse-fr_${pkgver}.${pkgbuild}.zip")
sha256sums=('9311b3fe3b2b0c5da17c06b91a204140d3de35872979cd75094a8f67868721f4')

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R ${srcdir}/eclipse ${pkgdir}/usr/share/
}
