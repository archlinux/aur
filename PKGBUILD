# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obbrowser
pkgver=0.06
pkgrel=1

pkgdesc="Recursively browse the filesystem through openbox3 pipe menus. (with icons)"
url="http://trizenx.blogspot.ro/2012/12/obbrowser.html"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b674bb27e5c03078bddd015c1b9fe7bf0d4848c48ba451c8cb26f6e89eab0172')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
