# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbrowse-tray
pkgver=0.07
pkgrel=1

pkgdesc="A file-browser through a Gtk2 tray status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPL3')

depends=('perl>=5.16.0' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8bcda9b34a1bc0d3a9c8b1e4e30398f785da171309a7fcca6f6c8b0d6151f680')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
