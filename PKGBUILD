# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=be
_debver=42.0
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-be
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Belarusian language package for Iceweasel"
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
sha256sums=('5cb170c8f1014fdd35cfc655680364fbdf0b8a35a7e70fc4bcd22865c195b03d')
