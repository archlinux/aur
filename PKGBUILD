# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=tungsten
pkgver=2.1
pkgrel=1
pkgdesc="A WolframAlpha CLI"
arch=('any')
url="https://github.com/ASzc/$pkgname"
license=('GPL3')
depends=('curl' 'jq' 'bash')
source=("https://raw.githubusercontent.com/ASzc/tungsten/release-$pkgver/tungsten.sh")
sha256sums=("7c71404e0aa0865124cb26262b72f4cbae752b500ae258e3fe80112d073eaade")

package() {
    cd "$srcdir"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
