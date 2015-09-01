# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=ga-ie
_debver=40.0.3
_debrel=3
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-ga-ie
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Irish language package for Iceweasel"
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
sha256sums=('3b58ebc7bdc15ed1652486c05b2e9e8d768d7cbd8b861fcf50140b28e9ea1411')
