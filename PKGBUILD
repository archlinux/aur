# $Id$
# Maintainer: Open Media Library <openmedialibrary@openmedialibrary.com>

pkgname=openmedialibrary
pkgver=0.1
pkgrel=1
pkgdesc="manage and sync your digital media collections"
url="https://openmedialibrary.com"
license=('GPL3')
arch=('any')
depends=('python' 'python-pillow' 'python-lxml' 'python-pyopenssl' 'python-crypto' 'poppler' 'python-gobject')
source=(https://downloads.openmedialibrary.com/$pkgname-$pkgver.tar.xz)
sha1sums=('518193cc1c8724e936fcced8ae8fa61600eefbf3')

package() {
  cd "${srcdir}"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
}
