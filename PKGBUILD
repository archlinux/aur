# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=zh-cn
_debver=43.0.2
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-zh-cn
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Chinese language pack for Iceweasel (Simplified)"
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
sha384sums=('d1c052f43e9c04e9506a95139ee83554a8db094e176879d02c83255360ed90c2647695bff755996d6ca847a567337c27')
