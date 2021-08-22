# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=fbrowse-tray
pkgver=0.09
pkgrel=1

pkgdesc="A file-browser through a Gtk2 tray status icon."
url="https://github.com/trizen/${pkgname}"

arch=('any')
license=('GPL3')

depends=('perl>=5.16.0' 'perl-gtk3' 'perl-file-mimeinfo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('82a3c4fce7534f4b7a6f8d154fca8f38576fe572bf3cca265fc99d9c00b05f38fceca981bdc99b9549206301e05e9ea142edabf93e4d2424b733878f2b3f896f')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
