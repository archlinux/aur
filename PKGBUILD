# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=javcap-bin
pkgver=0.2.17
pkgrel=1
pkgdesc="电影刮削器"
url="https://github.com/jane-212/javcap"
provides=("${pkgname%-bin}")
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/jane-212/javcap/releases/download/$pkgver/javcap-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0583640d0a344fa799cc03312c59376241a5b31affb864c065c2201f45570541')
sha256sums_aarch64=('a69e9cc330f257a07141c130ae1bab7b414e205c99e178ab72bd928849033716')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
