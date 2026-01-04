# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.3.10
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
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/runa-linux-arm64.tar.gz")
sha256sums=('18f0dc4cd8fadfc12ef6e05373ad5baf634cbc857ffe6076c65f8147c77d48de')
sha256sums_x86_64=('ed4480d8a3475ac9772f0bdd96945b06553355f4f1f45bb05b3d27c501a329c9')
sha256sums_aarch64=('b5572f3321fb56471155337858462453604de27dc45cb64b8d8d81c3788dda31')

package() {
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

