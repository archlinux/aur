# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=jsonlab
pkgver=2.0
pkgrel=1
pkgdesc="A toolbox to encode/decode JSON files in Matlab/Octave"
arch=("any")
url="https://github.com/fangq/jsonlab"
license=('BSD')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('923a9c811e2c9b1b7ceb7db0d97ed93eae642fe9b4bc0d49b1f475b220adfe2c')

package() {
    install -d "$pkgdir"/opt/$pkgname
    cp -r "$srcdir"/$pkgname-$pkgver/* "$pkgdir"/opt/$pkgname

    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s /opt/$pkgname/README.txt "$pkgdir"/usr/share/doc/$pkgname

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/$pkgname/LICENSE_BSD.txt "$pkgdir"/usr/share/licenses/$pkgname
}
