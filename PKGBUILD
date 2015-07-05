# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=sv-se
_debver=39.0
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-sv-se
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Swedish language package for Iceweasel"
arch=('any')
url="http://www.mozilla.com/"
license=('MPL' 'GPL' 'LGPL')
depends=("iceweasel>=$_debver") 
source=("${_debrepo}/iceweasel/iceweasel-l10n-${_lang}_${_debver}-${_debrel}_all.deb")

package() {
  msg2 "Installing Language Pack..."
  tar Jxvf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
  msg2 "Cleaning unwanted files..."
  rm -rv "${pkgdir}"/usr/share/
}
sha256sums=('cb056c8ac9d26b290c8c75c2bfdfc2a690129f7ba2cbc501a4e7165d40d3a83a')
