# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=dir2ogg
pkgver=0.13
pkgrel=1
pkgdesc="Converts mp3, m4a, wma, and wav files into ogg-vorbis format"
arch=('any')
url="http://jak-linux.org/projects/dir2ogg"
license=('GPL2')
depends=('python' 'python-mutagen' 'vorbis-tools')
source=("${url}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4181f3f968ab4d13dbf6369d483e0e937c611442d69cec787e8840cedc1d6ef8')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/man/man1

  cp ${pkgname}-${pkgver}/dir2ogg   ${pkgdir}/usr/bin
  cp ${pkgname}-${pkgver}/dir2ogg.1 ${pkgdir}/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
