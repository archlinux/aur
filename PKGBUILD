# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=sq
_debver=38.0.1
_debrel=5
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-sq
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Albanian language package for Iceweasel"
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


sha256sums=('dc02f908d0cf2d96e2f763591ded9afe0d805cb68eef201ed6ec1b793f04dd93')
