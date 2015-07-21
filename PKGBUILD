# Based on PKGBUILD: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Pekman

_lang=pt-br
_debver=31.8.0esr
_debrel=1~deb8u1
_debrepo=http://security.debian.org/debian-security/pool/updates/main/i/

pkgname=iceweasel-stable-bin-i18n-pt-br
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="Portuguese language package for Iceweasel (Brazil)"
arch=('any')
url="http://www.mozilla.com/"
license=('MPL' 'GPL' 'LGPL')
depends=("iceweasel>=$_debver") 
source=("${_debrepo}/iceweasel/iceweasel-l10n-${_lang}_${_debver}-${_debrel}_all.deb")
sha256sums=('c17a111dbfe122fd9a5dc5096e751c339962aaa2b6acf1c071f23038912b6ced')

package() {
  msg2 "Installing Language Pack..."
  tar Jxvf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
  msg2 "Cleaning unwanted files..."
  rm -rv "${pkgdir}"/usr/share/
}


