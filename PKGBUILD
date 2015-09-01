# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=ko
_debver=40.0.3
_debrel=3
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-ko
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Korean language package for Iceweasel"
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
sha256sums=('664eb67249c2efa28f082ac8506b2a851fe1e53bc13c3f70f1535dffdc759c00')
