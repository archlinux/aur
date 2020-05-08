# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Michael Bentlage <m.bentlage {at} gmail {dot} com>
pkgname=keepass-de
pkgver=2.45
pkgrel=1
pkgdesc="German locale for keepass"
arch=('any')
url="https://keepass.info/translations.html"
license=('GPL2')
depends=('keepass')
source=("https://downloads.sourceforge.net/keepass/KeePass-${pkgver}-German.zip")
sha1sums=('2f60efad89550cc03839eeacee837462b7983e60')
md5sums=('05e0ef497048757be60c2afdbb1f810e')

package(){
   install -Dm644 German.lngx "${pkgdir}/usr/share/keepass/Languages/German.lngx"
}
