# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7kaa-music
pkgver=2.15
pkgrel=1
pkgdesc='Music set for Seven Kingdoms: Ancient Adversaries'
url='http://7kfans.com/'
arch=('any')
license=('custom')
source=("http://www.7kfans.com/downloads/${pkgname}-${pkgver}.tar.bz2")
md5sums=('b5316f47e80409d216f55de411e2462c')


package() {
  # music files
  install -dm755 "${pkgdir}/opt/7kaa/MUSIC/"
  cd "${srcdir}/${pkgname}/MUSIC/"
  install -m644 *.WAV "${pkgdir}/opt/7kaa/MUSIC/"

  # readme
  install -D -m644 "${srcdir}/${pkgname}/README-Music.txt" "${pkgdir}/usr/share/doc/7kaa/README-Music"

  # license
  install -D -m644 "${srcdir}/${pkgname}/COPYING-Music.txt" "${pkgdir}/usr/share/licenses/7kaa/COPYING-Music"
}

# vim:set ts=2 sw=2 et:
