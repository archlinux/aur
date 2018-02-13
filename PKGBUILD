# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obbrowser
pkgver=0.09
pkgrel=1

pkgdesc="Recursively browse the filesystem through openbox3 pipe menus. (with icons)"
url="https://github.com/trizen/obbrowser"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('751bb8ec806198dbcd37fee133c8adeed02937e3bea39f142ef315621f392ade')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
