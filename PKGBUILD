# Maintainer: Drew Noel <drewmnoel@gmail.com>
pkgname=ike-trans
pkgver=1.2
pkgrel=1
pkgdesc="A variation of the IKE-SCAN user guide's transforms discovery script"
url="https://github.com/actuated/ike-trans/"
arch=("any")
license=('GPL')
depends=("ike-scan")
provides=("ike-trans")
source=("$pkgname-$pkgver.tar.gz::https://github.com/actuated/ike-trans/archive/v$pkgver.tar.gz")
md5sums=('414389f3b9d7581ee2982ce2eccf132d')

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 ike-trans.sh "$pkgdir/usr/bin/ike-trans"
}
