# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=chroma-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('c5ac9a5d0b5f49f5a0c8870aad47fd246a33e0a8cd01fae8486b5731d7126033')
sha256sums_i686=('06e25843c81429ad7790d2bdc8e298288f96abab9a919a45497d62a185b18d3d')
sha256sums_aarch64=('d0c669d5aca0a1288528d416cef8657342dc712344c84c08ac4b56357ce29867')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
