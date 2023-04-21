pkgname=x-pixiv-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
depends=("openssl-1.1")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.1/x-pixiv-1.0.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.1.0.1/x-pixiv-1.0.1-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('77e80e1c91f95b83ca50c5364d331c7135b11d9abb1465119291d33cf4a05758')
