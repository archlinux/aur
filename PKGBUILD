# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obbrowser
pkgver=0.07
pkgrel=1

pkgdesc="Recursively browse the filesystem through openbox3 pipe menus. (with icons)"
url="https://trizenx.blogspot.com/2012/12/obbrowser.html"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6808eaf10b53efade29e62660038aa82ab42facf98591cc667c2675747fbff82')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
