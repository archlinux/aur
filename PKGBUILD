pkgname=x-pixiv-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Pixiv downloader"
url="https://github.com/xiaoxigua-1/XPixiv"
license=("MIT")
arch=("x86_64")
provides=("x-pixiv")
conflicts=("x-pixiv")
depends=("openssl")
source_x86_64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/xiaoxigua-1/XPixiv/releases/download/v.0.1.6/x-pixiv-0.1.6-aarch64-unknown-linux-gnu.tar.gz")

package() {
    install -Dm755 x-pixiv -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('b63b23138e0a2e8d8da63f9950d1f78c4a55514f5b292f13cc80a768ef31ed8f')
