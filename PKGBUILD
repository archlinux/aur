# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=tungsten
pkgver=1.3
pkgrel=1
pkgdesc="A WolframAlpha CLI"
arch=('any')
url="https://github.com/ASzc/$pkgname"
license=('GPL3')
depends=('curl' 'xmlstarlet' 'bash')
source=("https://raw.githubusercontent.com/ASzc/tungsten/release-$pkgver/tungsten.sh")
sha256sums=("4bc7ad956023bac8e71492becd889ee1682653044107a4a8b65ca11e4c021b9a")

package() {
    cd "$srcdir"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
