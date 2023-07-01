# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=chroma-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('ddb5292a0910a7d9e74026728ef0b763780c4bdedf33a6803e66414db1d1e8aa')
sha256sums_i686=('b7172348369fbb3ef297d791ea4d4c0127985293416462d15e490177a3ac7de3')
sha256sums_aarch64=('40d86d6531fed7fba30ad04c9b725c7decc89d249138f61ad815e787e40519f6')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
