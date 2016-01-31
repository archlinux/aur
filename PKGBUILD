# Author ninjaaron < https://github.com/ninjaaron >
# Contributor sanderd < sanderd17 AT gmail DOT com >
# Maintainer: Ypnose <linuxienATlegtuxDOTorg>

pkgname=bdf-bitocra
pkgver=1.2
pkgrel=9
pkgdesc="A monospace bit font, inspired by OCR-A. Created to be very readable on small sizes"
url="http://ubuntuforums.org/showthread.php?t=1846868"
arch=('any')
license=('custom:OFL 1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('master.tar.gz::https://github.com/ninjaaron/bitocra/tarball/master')
install='bdf-bitocra.install'
md5sums=('0ead4e1894f9ea52caa7311b243a79d0')

package()
{
  cd "$srcdir/ninjaaron-bitocra-6e8ace5"
  
  install -d "$pkgdir/usr/share/fonts/misc"
  
  install -m644 *.bdf "$pkgdir/usr/share/fonts/misc"
  install -Dm644 README.asciidoc "$pkgdir/usr/share/doc/bdf-bitocra/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bdf-bitocra/LICENSE"
  install -Dm644 OFL-FAQ "$pkgdir/usr/share/licenses/bdf-bitocra/OFL-FAQ"
}
