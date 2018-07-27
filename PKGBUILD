# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=docker2aci-bin
_pkgname=docker2aci
pkgver=0.17.2
pkgrel=1
pkgdesc="CLI tool to convert Docker images to ACI."
arch=('x86_64')
url="https://github.com/appc/docker2aci"
source=("https://github.com/appc/docker2aci/releases/download/v$pkgver/$_pkgname-v$pkgver.tar.gz" "https://raw.githubusercontent.com/appc/$_pkgname/v$pkgver/LICENSE")
sha1sums=('ad896aeb2018a5aded50d686b5a69d0164ac3c0f'
          'c700a8b9312d24bdc57570f7d6a131cf63d89016')
license=('Apache2')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp $srcdir/$_pkgname-v$pkgver/$_pkgname $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
