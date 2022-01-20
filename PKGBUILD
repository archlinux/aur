#Maintainer alfredjophy <at> protonmail <dot> com
pkgname=urlbrowsermapper
__name__=browser-mapper
pkgver=1.0
pkgrel=1
pkgdesc="Map hostname/ips to different browsers and profiles"
arch=('any')
url="https://github.com/AlfredEVOL/${__name__}"
license=('GPL3')
depends=('python')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
package() {
    cd "${__name__}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
