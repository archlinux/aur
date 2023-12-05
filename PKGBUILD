# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=chroma-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('944a7c8cf86e69f5da68383fdca0a6fe6df2cc4b313407a7cb2b481fb89a90cf')
sha256sums_i686=('63dcbb7f7f0c6528d76f5d80a353ee87c3e87a7df7e5ca31a213c55a96401522')
sha256sums_aarch64=('898ea58dc5cd29acf6dd7a7d49ae90580090ddef210d9f459ecabb69af7a2482')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
