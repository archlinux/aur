pkgname=arptofile
pkgver=1.0
pkgrel=1
pkgdesc="An arp-scan script that prints necessary information to a file"
arch=('any')
url=""
license=('MIT')  # Adjust as necessary
depends=('arp-scan' 'grep')
source=("arptofile")  # The file to be installed
md5sums=('SKIP')  # Replace with actual checksums if desired

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
