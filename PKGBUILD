# Maintainer: port19 <port19 at port19 dot xyz>
pkgname='redqu'
pkgver=1.2
pkgrel=1
pkgdesc='A reddit rss media queue extractor'
arch=('any')
url='https://github.com/port19x/redqu'
license=('Unlicense')
depends=('babashka-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/port19x/redqu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fa60a33e850988fecc73215aa7919b27d24b2fb5d3e084735d129eb62c7db5e')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "./redqu" "$pkgdir/usr/bin/redqu"
}
