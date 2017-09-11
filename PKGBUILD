# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbrowse-tray
pkgver=0.08
pkgrel=1

pkgdesc="A file-browser through a Gtk2 tray status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPL3')

depends=('perl>=5.16.0' 'gtk2-perl' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9cb83ec3e8f40076eb6e2bbd67f36cbb1859fd6799f5232eaa87a1feedf3e49a')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
