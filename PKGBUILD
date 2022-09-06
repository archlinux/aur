# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=obbrowser
pkgver=0.15
pkgrel=1

pkgdesc="Recursively browse the filesystem through Openbox pipe menus. (with icons)"
url="https://github.com/trizen/obbrowser"

arch=('any')
license=('GPL3')

depends=('perl>=5.14.0' 'perl-data-dump' 'perl-gtk3' 'perl-file-mimeinfo')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('c15420591c44ce1ff685fc68147435279883d4410e7fa0a9e692a460cd90d7143f56617d85ce0134c7867afb3f38fd34477d0b64a591840cb840e423c6c9e991')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
