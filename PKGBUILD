# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=2480
pkgname=koma-script
pkgver=3.21.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha1sums=('370f30ec20ae339a68c172cb57bfc53ab4e084aa')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
