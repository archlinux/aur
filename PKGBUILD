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
sha1sums=('5524083d748218034f125599308b7661c529beb4')

package() {
  cd "${pkgbase}-${pkgver}"
  make install PREFIX=/usr DESTDIR="${pkgdir}"
}
