# Maintainer: Zack Grannan <zgrannan at gmail dot com>

pkgname=ttf-saweri
pkgver=2
pkgrel=1
pkgdesc="Font for Buginese script."
arch=('any')
url="https://sites.google.com/site/niariot87/"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unrar')
source=(https://sites.google.com/site/niariot87/SaweriV2.rar)
md5sums=('0e7240863dcb1f291d9689ac7d95ae2e')
install=$pkgname.install

prepare()
{
  unrar e -y SaweriV2.rar
}

package()
{
  mkdir -p "${pkgdir}/usr/share/fonts/TTF"
  cp "${srcdir}/swrbV2.ttf" "${pkgdir}/usr/share/fonts/TTF/"
  cp "${srcdir}/swrnV2.ttf" "${pkgdir}/usr/share/fonts/TTF/"
}
