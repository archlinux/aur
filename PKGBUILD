# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=lpx-bin
_pkgname=lpx
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal Animated GIF Viewer (Pre built binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/lusingander/lpx'
license=('MIT')
makedepends=('cargo')
provides=('lpx')
conflicts=('lpx' 'lpx-git')
source=("LICENSE::https://raw.githubusercontent.com/lusingander/lpx/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64-bin.tar.gz::$url/releases/download/v$pkgver/lpx-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-bin.tar.gz::$url/releases/download/v$pkgver/lpx-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3b607b61bbba8e9b3bd2528080993dc454268b7b3c185ae98d02057ac5ddcc3f')
sha256sums_x86_64=('f7a55797d573cb7854f0bc4d80a699b468ac95452235a94597b2bc4f325e2a74')
sha256sums_aarch64=('7c2e6f4c64eb0d6f2ec663fd4ec7ecc2a13f7d8dcaa660cadabd6dfce1d31fb9')

package() {
    install -Dm0755 lpx "${pkgdir}"/usr/bin/lpx
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
