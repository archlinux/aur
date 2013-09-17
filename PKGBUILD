# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=eclipse-i18n-de
pkgver=4.3.0
pkgrel=1
_buildid=R0.11.0
_release=v20130724043401
_codename=kepler
pkgdesc="German language pack for eclipse IDE"
url="http://babel.eclipse.org/"
arch=('any')
license=('EPL')
depends=('eclipse>=4.3')
conflicts=('eclipse-i18n-pack1')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-eclipse-de_$pkgver.$_release.zip")
md5sums=('634a1523a61884edbc54430dee4095ca')
sha256sums=('585afb92f50d5a04ebc607c4907d6b255df5c814f5cbd8c6d359ee78604fa06b')

# no build() needed
package() {
  mkdir -p $pkgdir/usr/share/
  cp -R $srcdir/eclipse $pkgdir/usr/share/
}
