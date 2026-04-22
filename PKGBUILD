# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cranko-bin
_pkg="${pkgname%-bin}"
pkgver=0.17.3
pkgrel=1
pkgdesc='Cross-platform, cross-language release automation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/pkgw/cranko'
license=('MIT')
depends=('libgcc_s.so' 'libssl.so' 'libz.so')
provides=("$_pkg")
conflicts=("$_pkg")
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/${_pkg}%40${pkgver}/$_pkg-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/${_pkg}%40${pkgver}/$_pkg-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('8f71659370c5268d9a1dc962a46232540e8fca63462586d8efaa95aab492a208')
sha256sums_x86_64=('0144245842ba4e3d13d7538292919bea7e9266b6a1afc0b213f781aab7e7ef08')
sha256sums_aarch64=('2d92e47a9baf60e7853512ad2c7093157d781478849b34908540ed7813098ffb')

package() {
    install -D "$_pkg" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
