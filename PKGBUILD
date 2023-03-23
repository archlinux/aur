# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2d-res
pkgver=1.35
pkgrel=1
pkgdesc="Resources for Doom2D"
arch=(any)
url="https://doom2d.org/"
license=('proprietary')
source=(
  'https://deadsoftware.ru/files/terminalhash/doom2df-packages/d2d-res.zip'
)
md5sums=(
  'd125fd71fc07830d4e36e7405885a0da'
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/doom2d/
  cp doom2d.wad megadm.wad superdm.wad default.cfg "${pkgdir}"/usr/share/doom2d/
}
