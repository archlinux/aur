pkgname=ods-bin
pkgver=0.0.1
pkgrel=0
pkgdesc="CLI for Open Data Schema"
arch=('x86_64' 'i686')
url="https://github.com/open-data-schema/ods"
license=("MIT")
provides=("ods")
conflicts=("ods")
source_x86_64=($pkgname-$pkgver.zip::https://github.com/open-data-schema/ods/releases/download/v$pkgver/ods-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("Not Found")
source_i686=($pkgname-$pkgver.zip::https://github.com/open-data-schema/ods/releases/download/v$pkgver/ods-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("Not Found")

package() {
    cd "$srcdir"
    install -Dm755 "ods" "$pkgdir/usr/bin/ods"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ods/LICENSE"
}
