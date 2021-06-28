pkgname=calz-bin
pkgver=0.9.2.0
pkgrel=1
pkgdesc="A natural language alternative to Unix 'cal'"
url="https://github.com/jez/calz"
license=("MIT")
arch=("x86_64")
conflicts=("calz")
provides=("calz")
source=("https://github.com/jez/calz/releases/download/${pkgver}/calz-${pkgver}-linux.tar.gz")
sha512sums=("96ec6f818a97d25dc84cd6eb2b9ba4bd56f7ae806a69f06a0447ac8e03c5cba845b67e22d0014ecc419627ec5c8c08b8989b360dfa411868a0900fbd10110c6d")

package() {
    install -Dm755 calz "${pkgdir}/usr/bin/calz"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/calz/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/calz/README.md"
}
