# Author ninjaaron < https://github.com/ninjaaron >
# Contributor sanderd < sanderd17 AT gmail DOT com >
# Maintainer: Ypnose <linuxienATlegtuxDOTorg>

pkgname=bdf-bitocra
pkgver=1.2
pkgrel=11
_tag="223d56a"
pkgdesc="A monospace bit font, inspired by OCR-A. Created to be very readable on small sizes"
url="http://ubuntuforums.org/showthread.php?t=1846868"
arch=('any')
license=('custom:OFL 1.1')
depends=('xorg-fonts-encodings')
source=("bitocra-$_tag.tar.gz::https://github.com/ninjaaron/bitocra/tarball/master")
md5sums=('fe5a42b724a43a2b664bc2e07a7a4cd8')

package()
{
  cd "$srcdir/ninjaaron-bitocra-$_tag"
  
  install -d "$pkgdir/usr/share/fonts/misc"
  
  install -m644 *.bdf "$pkgdir/usr/share/fonts/misc"
  install -Dm644 README.asciidoc "$pkgdir/usr/share/doc/bdf-bitocra/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bdf-bitocra/LICENSE"
  install -Dm644 OFL-FAQ "$pkgdir/usr/share/licenses/bdf-bitocra/OFL-FAQ"
}
