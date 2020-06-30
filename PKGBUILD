# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=tungsten
pkgver=2.0
pkgrel=1
pkgdesc="A WolframAlpha CLI"
arch=('any')
url="https://github.com/ASzc/$pkgname"
license=('GPL3')
depends=('curl' 'jq' 'bash')
source=("https://raw.githubusercontent.com/ASzc/tungsten/release-$pkgver/tungsten.sh")
sha256sums=("d3badabce4fa60edd6725d5d4087e034c1160cbdcda7b939ca8bc5ba5a0571d7")

package() {
    cd "$srcdir"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
