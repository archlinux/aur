# Maintainer: Lex Black <autumn-wind at web dot de>
# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=7kaa-music
pkgver=2.13
pkgrel=3
pkgdesc='Music set for Seven Kingdoms: Ancient Adversaries'
url='http://7kfans.com/'
arch=('any')
license=('custom')
source=("http://www.7kfans.com/downloads/${pkgname}.tar.bz2")
md5sums=('90716e41b58e56b816ffea797fb24676')


package() {
  # music files
  install -dm755 "${pkgdir}/opt/7kaa/music/"
  cd "${srcdir}/${pkgname}/music/"
  install -m644 *.wav "${pkgdir}/opt/7kaa/music/"

  # readme
  install -D -m644 "${srcdir}/${pkgname}/README-Music.txt" "${pkgdir}/usr/share/doc/7kaa/README-Music"

  # license
  install -D -m644 "${srcdir}/${pkgname}/COPYING-Music.txt" "${pkgdir}/usr/share/licenses/7kaa/COPYING-Music"
}

# vim:set ts=2 sw=2 et:
