# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cranko-bin
_pkg="${pkgname%-bin}"
pkgver=0.13.0
pkgrel=2
pkgdesc='Cross-platform, cross-language release automation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/pkgw/cranko'
license=('MIT')
depends=('gcc-libs' 'openssl' 'zlib')
provides=("$_pkg")
conflicts=("$_pkg")
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/${_pkg}%40${pkgver}/$_pkg-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/${_pkg}%40${pkgver}/$_pkg-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('8f71659370c5268d9a1dc962a46232540e8fca63462586d8efaa95aab492a208')
sha256sums_x86_64=('570d04fb5141485ce02363dc560ba6f0d56dfdb7649fa3b3d5023d80ee8fca29')
sha256sums_aarch64=('bee8b2eb3f2951a8526896c9f6e635573886b48e03f758657c212201bfc4ba8e')

package() {
	install -D "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
