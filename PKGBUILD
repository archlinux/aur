# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obbrowser
pkgver=0.05
pkgrel=1

pkgdesc="Recursively browse the filesystem through openbox3 pipe menus. (with icons)"
url="http://trizenx.blogspot.ro/2012/12/obbrowser.html"

arch=('any')
license=('GPLv3')

depends=('perl>=5.14.0' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08' 'perl-file-mimeinfo')
source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('aecab19c197aebb66417433ec96f7e2e9a1387a4720d39547854b609da5af3d4')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
