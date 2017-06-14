# Maintainer: pancho horrillo <pancho at pancho dot name>

pkgname=the_platinum_searcher-bin
pkgdesc='A code search tool similar to ack and the_silver_searcher(ag).  Pre-compiled.'
pkgver=2.1.5
pkgrel=1
arch=('x86_64')
url='https://github.com/monochromegane/the_platinum_searcher'
license=('MIT')

provides=('the_platinum_searcher')
conflicts=('the_platinum_searcher')

source_x86_64=("https://github.com/monochromegane/the_platinum_searcher/releases/download/v$pkgver/pt_linux_amd64.tar.gz")

sha512sums_x86_64=('1084d9b9054cfe66151d4751efb292e66d9369e330d67baa87b81aeb31e2eda29821b363933eaa10b2cd52c15fa2f5b8ed97c655db2c1f3ac76983e9d2844f2c')

package() {
  install -Dm 755 "$srcdir/pt_linux_amd64/pt"         "$pkgdir/usr/bin/pt"
  install -Dm 644 "$srcdir/pt_linux_amd64/README.md"  "$pkgdir/usr/share/doc/pt/README.md"
}
