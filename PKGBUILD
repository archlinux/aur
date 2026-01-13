# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.5.1
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
sha256sums_x86_64=('baa2e4ee3e48db648fd45cf41b8df21f1fc37e41711c504f253b6a9399aeab24')
sha256sums_aarch64=('f7eb646af2b12ea0c8baf3f7e5f49acd60318192b10ded8323434c6176f13e92')

package() {
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

