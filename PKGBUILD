# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=fr
_debver=42.0
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-fr
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="French language package for Iceweasel"
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
sha256sums=('eda80cdb42d689dc51e1e5240c5c02df697fa0d062acc60c8c32e5ec29d4525b')
