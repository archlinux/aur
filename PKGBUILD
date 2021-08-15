pkgname='biblesay'
pkgver='1.0'
pkgrel=1
pkgdesc='Print out one out of 100 verses in a speech bubble coming from an ASCII-Art dove in your UNIX-Terminal.'
arch=('any')
url='https://github.com/theeyeofcthulhu/biblesay'
license=('GPL')
makedepends=('python' 'git')
source=('git://github.com/theeyeofcthulhu/biblesay')
sha1sums=('SKIP')

package() {
    cd "${pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
