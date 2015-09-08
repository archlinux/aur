# Maintainer: Markus Tacker <m@cto.hiv>
pkgname=otf-hack
pkgver=2.013
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/chrissimpkins/Hack/raw/v$pkgver/build/otf/Hack-{Bold,BoldItalic,Italic,Regular}.otf)
md5sums=('71cd5be3cd70bccb91f0b9e637e0b9d6'
'6542f8afee6e5f7de217421de03124ef'
'7a195a69352e01ff254db41df174942b'
'9c2f58004d9d31b6f41e9482033f61bb')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/OTF
  install -m644 $srcdir/Hack-*.otf $pkgdir/usr/share/fonts/OTF
}
