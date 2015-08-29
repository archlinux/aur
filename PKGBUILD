# Maintainer: Markus Tacker <m@cto.hiv>
pkgname=ttf-hack
pkgver=2.010
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/chrissimpkins/Hack/raw/v$pkgver/build/ttf/Hack-{Bold,BoldOblique,Regular,RegularOblique}.ttf)
md5sums=('81ca1b338503c538de1aef5b1a05167e'
'820b6dd5201fcda765492f47a51ccc59'
'4fea277591543c1fd64a9cf06ec5803a'
'd5c7cd4911c672e9d0709367ad7424b4')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/Hack-*.ttf $pkgdir/usr/share/fonts/TTF
}
