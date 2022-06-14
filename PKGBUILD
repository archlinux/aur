# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=chroma-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('6bd87b2a256170eea70e80fa6917ebc25435a399f6a8a461373df3a01e9419c5')
sha256sums_i686=('05abf52c5e25181fdaec7325395c6cfb4180d67642c02cc6c079ad6b781f561f')
sha256sums_aarch64=('6c972263bbd0d3b0f959f87e98ec88c0d91c9ea9f689edb32445a50dc46d4043')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
