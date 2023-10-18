# Maintainer: port19 <port19 at port19 dot xyz>
pkgname='redqu'
pkgver=2.0
pkgrel=1
pkgdesc='A media centric reddit client'
arch=('any')
url='https://github.com/port19x/redqu'
license=('Unlicense')
depends=('python-requests' 'mpv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/port19x/redqu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('76ac25db6c3abd1e37f50594bc89a1f7cf48ee422c9ee811d21a1ddcda48b72b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "./redqu.py" "$pkgdir/usr/bin/redqu.py"
    ln -sf "$pkdir/usr/bin/redqu.py" "$pkgdir/usr/bin/redqu"
}
