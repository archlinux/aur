# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgname=projog
pkgver=0.10.0
pkgrel=1
pkgdesc='Prolog interpreter for Java'
arch=(any)
url='http://www.projog.org/'
license=(Apache-2.0)
depends=(java-runtime)
options=(!strip)
source=("http://www.projog.org/downloads/$pkgname-$pkgver.zip")
sha256sums=('d064e3b590074126a5c1eb093c7640ac860ef3711ed7a610061d68341cb97b10')

package() {
    cd "$pkgname-$pkgver"
    install -D --mode=644 -t "$pkgdir/usr/share/java/projog" lib/*.jar
    install -D --mode=755 projog-console.sh "$pkgdir/usr/bin/projog"
}
