# Maintainer: goetzc
pkgname=seeker
pkgver=2.0
pkgrel=1
pkgdesc='Utility to find out the storage medium access time (latency)'
arch=(any)
url="http://linuxinsight.com/how_fast_is_your_disk.html"
license=('GPL2')
depends=('gcc')
source=("http://linuxinsight.com/sites/default/files/$pkgname.c")
sha256sums=('6b7aaf278db36a7eb27e54e3abed23dab3c4594acf87d592e626df8432ec1b54')

package() {
    gcc -O2 $pkgname.c -o $pkgname
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
