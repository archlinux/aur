# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=tungsten
pkgver=1.2
pkgrel=1
pkgdesc="A WolframAlpha CLI"
arch=('any')
url="https://github.com/ASzc/$pkgname"
license=('GPL3')
depends=('curl' 'xmlstarlet' 'bash')
source=("https://github.com/ASzc/$pkgname/raw/release-$pkgver/$pkgname.sh")
sha256sums=('74d3dcf488680b3213f51b8740394ccf0e6c4c9e644a7cfb9d6a54d60349b582')

package() {
    cd "$srcdir"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
