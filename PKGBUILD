# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obbrowser
pkgver=0.13
pkgrel=2

pkgdesc="Recursively browse the filesystem through Openbox pipe menus. (with icons)"
url="https://github.com/trizen/obbrowser"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'perl-file-mimeinfo')
optdepends=(
    'gtk2-perl: support for icons'
    'perl-gtk3: support for icons (with `use_gtk3 = 1`)'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('59b63eafdfe8396f8049232f38361c2397098e0a4e148bfc999f4a2083aaf3ac')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
