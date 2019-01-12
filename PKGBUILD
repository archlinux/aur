# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=3050
pkgname=koma-script
pkgver=3.25.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha512sums=('2e97e291cd83b8db6ae7f1c09808789694ea7a85ff8861857a1c5082cc9ef6108b09473f2d9a6545136f255c9a12e2e5313ebe1722dfa20666abcef2c450390b')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
