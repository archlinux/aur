# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=happycamel
pkgver=1.b3
pkgrel=6
pkgdesc="a script that analyzes a GPS-tracklog to find the position where digital images were taken"
arch=('any')
url="http://happycamel.sourceforge.net/"
license=('GPL')
depends=('python2' 'perl-exiftool' 'python2-pillow')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/v1-beta3/${pkgname}-v1-beta3.tar.gz"
        "image_pil.patch")
md5sums=('16ef03495707b37acbd7a4015af37745'
         'e60a6913e9713a7cd75d2ebad10820e8')

package() {
  cd $srcdir/happycamel-v1-beta3
  python2 setup.py install --root=$pkgdir/ --prefix=/usr
}
