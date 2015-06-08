# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=pl
_debver=38.0.1
_debrel=5
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-pl
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Polish language package for Iceweasel"
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


sha256sums=('f8b8fc65af84da0395d684d7f5dc91cfcdbc3ef1c305bea74bd6b92f1716477f')
