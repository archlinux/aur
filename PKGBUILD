pkgname='biblesay'
pkgver=1.0
pkgrel=1
pkgdesc='Print out one out of 99 bible verses in a speech bubble coming from an ASCII-Art dove in your UNIX-Terminal.'
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
