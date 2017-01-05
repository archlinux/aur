# $Id$
# Maintainer: Open Media Library <openmedialibrary@openmedialibrary.com>

pkgname=openmedialibrary
pkgver=0.2
pkgrel=2
pkgdesc="manage and sync your digital media collections"
url="https://openmedialibrary.com"
license=('GPL3')
arch=('any')
depends=('python' 'python-pillow' 'python-lxml' 'python-pyopenssl' 'python-crypto' 'poppler' 'python-gobject')
source=(https://downloads.openmedialibrary.com/$pkgname-$pkgver.tar.xz)
sha1sums=('b30c2cec0dc63dd5136acf5df47cf18985f1e292')

package() {
  cd "${pkgbase}-${pkgver}"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
}
