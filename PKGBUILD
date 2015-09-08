# Maintainer: Markus Tacker <m@cto.hiv>
pkgname=ttf-hack
pkgver=2.013
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(https://github.com/chrissimpkins/Hack/raw/v$pkgver/build/ttf/Hack-{Bold,BoldItalic,Italic,Regular}.ttf)
md5sums=('7c7d60b5d004763bbdaaaf56456a1eab'
'1c3d49795b84f1909c01e56ea20b1b3b'
'f577799f0922cc3b70b2eb5b7c068e69'
'ff3ff921eacbb0df56bc6c4315a8c1ae')

package() {
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 $srcdir/Hack-*.ttf $pkgdir/usr/share/fonts/TTF
}
