# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbrowse-tray
pkgver=0.05
pkgrel=1

pkgdesc="Browse the filesystem through a tray Gtk2 status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPLv3')

depends=('perl>=5.16.0' 'gtk2-perl' 'perl-file-mimeinfo')
source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('b285a70f7e234427b4116df0ad64500abc20ea9e5a212d7cfd2f8e066b202831')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
