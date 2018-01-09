# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=2673
pkgname=koma-script
pkgver=3.24.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha256sums=('0d435c57f69ab094e3dc74676c847dcc27b5ff3215474f9cd49668cdeb263b0d')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
