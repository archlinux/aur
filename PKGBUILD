# Maintainer: Bryn Edwards <bryn at openmailbox dot org>
pkgname=docker2aci-bin
_pkgname=docker2aci
pkgver=v0.14.0
pkgrel=1
pkgdesc="CLI tool to convert Docker images to ACI."
arch=('x86_64')
url="https://github.com/appc/docker2aci"
source=("https://github.com/appc/docker2aci/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz" "https://raw.githubusercontent.com/appc/$_pkgname/$pkgver/LICENSE")
sha1sums=('5d2f9f05a51cc18b4f555353b847e1c4370575b5'
          'c700a8b9312d24bdc57570f7d6a131cf63d89016')
license=('Apache2')

package() {
    mkdir -p $pkgdir/usr/bin/
    cp $srcdir/$_pkgname-$pkgver/$_pkgname $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
    cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
