# Maintainer: damir <sudo point pacman at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-mph-2b-damase
pkgver=002.000
pkgrel=1
pkgdesc='Unicode font covering full plane 1, and numerous scripts'
url="https://www.dafont.com/mph-2b-damase.font" 
license=('custom:Public_Domain')
arch=('any')
source=("${pkgname#ttf-}::https://dl.dafont.com/dl/?f=mph_2b_damase")
sha1sums=('2993a82888fe5d1418616cf6b6098140c4d4a6ce')

package() {
  install -dm755 "${pkgdir}"/usr/share/{fonts/TTF,licenses/${pkgname}}
  install -m644 damase_v.2.ttf "${pkgdir}"/usr/share/fonts/TTF/damase.ttf
  echo 'No copyright applies; this work is in the public domain.' > "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
