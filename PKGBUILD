# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obbrowser
pkgver=0.14
pkgrel=2

pkgdesc="Recursively browse the filesystem through Openbox pipe menus. (with icons)"
url="https://github.com/trizen/obbrowser"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'perl-gtk3' 'perl-file-mimeinfo')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3bf1d93d004ea6c3a5824e449faf3ac24346ae270d9b5fbb4c104f9cc3b0dcc4175a836abfa9abff0dbb2ad20612cfc8c007d9293f663ed55dd34605ae9863b8')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
