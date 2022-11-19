# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=chroma-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/alecthomas/chroma'
license=(MIT)
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('bc399fbeb68fb26bdbc3c969b3c051239574ac0dc6175c1f63e34d05a1a0958f')
sha256sums_i686=('46c7e3c4a38990bd3b4846487b533b9533531b36205759940de1c3bee061b9d7')
sha256sums_aarch64=('cf52a6cc9eef3d08acee2fcccefb49eeb7521befca61ff7f1f02776658419302')

package() {
    install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
