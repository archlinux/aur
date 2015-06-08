## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=dff2dsf
_debpkgver=1.2.2
pkgver=$_debpkgver
pkgrel=1
pkgdesc="Signalyst DFF to DSF command line conversion utility"
arch=('x86_64')
url="http://www.signalyst.com/professional.html"
license=('custom')
depends=('glibc' 'gcc-libs')
source=('http://www.signalyst.com/binx/dff2dsf-122.zip')
sha256sums=('77ae7297ee1a6efe72014c7ebfd68033be40fae0246e10fc35eb7a252dd1f685')

package() {
 cd "$srcdir"
 bsdtar -xf dff2dsf-122.zip -C "$srcdir"
     install -Dm755 "$srcdir/linux-x64/dff2dsf" "$pkgdir/usr/bin/dff2dsf"
     install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}