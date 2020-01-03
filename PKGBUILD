# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=3445
pkgname=koma-script
pkgver=3.25.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha512sums=('5bc1c7e2b00ce46cdd1b7ac45649a11cf5400371f1c0a1f061878d217a983b516d0d58d18aab9d81cb851dae01cee39999e3906fcda1a435a2cdd1e68523d208')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
