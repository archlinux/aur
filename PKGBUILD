# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.5.5
pkgrel=1
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT')
depends=('gcc-libs')
provides=('runa')
conflicts=('runa')
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/runa-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/runa-linux-aarch64.tar.gz")
sha256sums=('18f0dc4cd8fadfc12ef6e05373ad5baf634cbc857ffe6076c65f8147c77d48de')
sha256sums_x86_64=('943b8fb6667432b5dfab7369ad7ab4d8fa860f016f772337e6c5eb5911477a36')
sha256sums_aarch64=('aa6354bd44a1d73d612e34e782d5a34a090127b78604e3dd70beb76f32ab9399')

package() {
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

