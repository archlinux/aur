# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=gu-in
_debver=38.0.1
_debrel=5
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-gu-in
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Gujarati language pack for Iceweasel (India)"
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
sha256sums=('b298c6ddd9c59b472af869798d87fc97ea6a797749c39888abd054fb17d217aa')
