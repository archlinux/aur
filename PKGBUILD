pkgname=ods-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI for Open Data Schema"
arch=('x86_64' 'i686')
url="https://github.com/open-data-schema/ods"
license=("MIT")
provides=("ods")
conflicts=("ods")
source_x86_64=($pkgname-$pkgver.zip::https://github.com/open-data-schema/ods/releases/download/v$pkgver/ods-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("2ca58310e5bf04400a4749f9e30293d510e1ee27be373c1d99d5c274086fbc61")
source_i686=($pkgname-$pkgver.zip::https://github.com/open-data-schema/ods/releases/download/v$pkgver/ods-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("a4190e661a2178d9d60929d4f464910e3ceedec8d400f357bf8272cb5812e7da")

package() {
    cd "$srcdir"
    install -Dm755 "ods" "$pkgdir/usr/bin/ods"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ods/LICENSE"
}
