# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbrowse-tray
pkgver=0.06
pkgrel=1

pkgdesc="Browse the filesystem through a tray Gtk2 status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPL3')

depends=('perl>=5.16.0' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1a450c0641fb32719dc7860ff22fe2d33b1ea58c39a5d7a9e010ef0bc3201546')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
