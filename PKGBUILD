# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=awextract
pkgver=1.0
pkgrel=1
pkgdesc="Extract .wav files from .aw files in Nintendo Wii game disks"
arch=('any')
url="http://nothing.i/made/this/script/:)"
license=('GPL')
depends=('szstools' 'baad' 'wsyster')
source=('awextract')
sha512sums=('0a5fabc7d7fe149379251e111d92dcd26e3e5f45e6750b08949657c13c9c912412b74c1cc615d6c5487de9266e740ea84eb1b106394f05e65468d2032418e2d5')

package() {
  cd "${srcdir}"
  install -Dm755 awextract "${pkgdir}/usr/bin/awextract"
}

# vim:set ts=2 sw=2 et:
