# Maintainer: Markus Tacker <m@cto.hiv>
pkgname=otf-hack
pkgver=2.010
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/chrissimpkins/Hack/raw/v$pkgver/build/otf/Hack-{Bold,BoldOblique,Regular,RegularOblique}.otf)
md5sums=('328a5888b0db742f06fc74fdaa127c33'
'4e82325b478b9d2b0c4f60df95e8dfdf'
'61ad16e40a24bd9d0931108af0468b9c'
'59572651d88c4d88cb5a27238927ca9f')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 $srcdir/Hack-*.otf $pkgdir/usr/share/fonts/OTF
}
