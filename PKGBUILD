# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=en-gb
_debver=40.0.3
_debrel=3
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-en-gb
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="English language package for Iceweasel (United Kingdom)"
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
sha256sums=('04707b27d53e2bf7e47ff833268c2fb6eb78c58c6219b0776f8d1c43f8c00935')
