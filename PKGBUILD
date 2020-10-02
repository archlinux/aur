# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Alexander Kratzsch <alexander-kratzsch at web dot de>

_revision=3546
pkgname=koma-script
pkgver=3.32.${_revision}
pkgrel=1
pkgdesc="A versatile bundle of LaTeX2e document classes and packages"
arch=("any")
url="http://www.komascript.de/"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://sourceforge.net/projects/koma-script/files/KOMA-Script/koma-script-${_revision}.zip")
sha512sums=('3bc34e00bd66f0d379e2457772888fc07fe936db27db56d2cbe144c4359be88573791a6e1364c287dfb0f7d48460b6d741938dc3d454bed2e1f7e24b2f5aadf7')
install=texlive.install

package() {
  cd "$srcdir/"

  install -m775 -d "$pkgdir/usr/share/texmf"
  cp -R doc/ tex/ "$pkgdir/usr/share/texmf"
}
