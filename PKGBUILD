# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=docker2aci-bin
pkgver=v0.16.0
pkgrel=1
pkgdesc="CLI tool to convert Docker images to ACI."
arch=('x86_64')
url="https://github.com/appc/docker2aci"
source=("https://github.com/appc/docker2aci/releases/download/$pkgver/${pkgname:0:-4}-$pkgver.tar.gz" "https://raw.githubusercontent.com/appc/${pkgname:0:-4}/$pkgver/LICENSE")
sha1sums=('e080dd80e8f90fe95212ca5596fb0b31c160f539'
          'c700a8b9312d24bdc57570f7d6a131cf63d89016')
license=('Apache2')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp $srcdir/${pkgname:0:-4}-$pkgver/${pkgname:0:-4} $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/licenses/${pkgname:0:-4}/
    cp LICENSE $pkgdir/usr/share/licenses/${pkgname:0:-4}/
}
