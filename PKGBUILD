# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=th
_debver=41.0.2
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-th
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Thai language pack for Iceweasel"
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
sha256sums=('d4d4600ba2aaedfa49e2ac1183a2e9818e1479fe4d4564fc79022f44b6b038e3')
