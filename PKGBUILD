# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=pt-pt
_debver=38.0.1
_debrel=5
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-pt-pt
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Portuguese language package for Iceweasel (Portugal)"
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


sha256sums=('7da2000b356ea4dc8ee459b2d64d42d66bbce3fc813f636116636623fbc1b18e')
