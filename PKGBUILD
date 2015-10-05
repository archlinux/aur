# Maintainer: superlex

_lang=it
_debver=41.0.1
_debrel=1
_debrepo=http://ftp.debian.org/debian/pool/main/i/

pkgname=iceweasel-i18n-it
pkgver=$_debver.deb$_debrel
pkgrel=2
pkgdesc="Italian language pack for Iceweasel"
arch=('any')
url="https://packages.debian.org/experimental/iceweasel-l10n-it"
license=('MPL' 'GPL')
depends=("iceweasel>=$_debver") 
source=("${_debrepo}/iceweasel/iceweasel-l10n-${_lang}_${_debver}-${_debrel}_all.deb")
sha1sums=('ea73ddec0ef3c01d652c715b829efa5e70117a28')

package() {
  msg2 "Installing Language Pack..."
  tar Jxvf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
  msg2 "Cleaning unwanted files..."
  rm -rv "${pkgdir}"/usr/share/
}
