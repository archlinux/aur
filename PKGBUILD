# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obbrowser
pkgver=0.08
pkgrel=1

pkgdesc="Recursively browse the filesystem through openbox3 pipe menus. (with icons)"
url="https://github.com/trizen/obbrowser"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('639897c0c201fe5ae7bae5d10e2d57cd1610ecefe7e60a47b2f01c79401af179')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
