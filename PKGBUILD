pkgname='biblesay'
pkgver=1.1
pkgrel=1
pkgdesc='Print out a random bible verse in a speech bubble coming from an ASCII-Art dove in your terminal.'
arch=('any')
url='https://github.com/theeyeofcthulhu/biblesay'
license=('GPL')
depends=('python')
source=("https://github.com/theeyeofcthulhu/biblesay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd $srcdir/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
