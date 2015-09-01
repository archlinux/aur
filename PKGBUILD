# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=tr
_debver=40.0.3
_debrel=3
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-tr
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Turkish language pack for Iceweasel"
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
sha256sums=('508ae80663f860abc1120a16754b18a560c6252539dbdcbd69a104b764e7a500')
