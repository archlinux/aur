# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

_lang=bg
_debver=40.0.3
_debrel=3
_debrepo=http://ftp.debian.org/debian/pool/main/i

pkgname=iceweasel-i18n-bg
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Bulgarian language package for Iceweasel"
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
sha256sums=('db8558f4eb5285d18a68d455fa70a083a7f3806b218f4eaacc2757b9b4eac43e')
