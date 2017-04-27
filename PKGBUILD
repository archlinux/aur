# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=apk-tools
pkgver=0.14
pkgrel=1
pkgdesc='A very simple but powerful shell-based package manager for UNIX like RAM-based embedded systems.'
url='http://apk-tools.sourceforge.net/'
arch=(any)
license=(GPL2)
depends=(sh)
source=("http://prdownloads.sourceforge.net/apk-tools/${pkgname}-${pkgver}.tar.gz")
sha256sums=('409a11e7a170513599cf0e55b91475abb1549d8d22f30a3d64e7f70820164269')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}/usr
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}
