# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.3.5
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
sha256sums_x86_64=('bbcfa5c59cf6a9698e084c0be9ba42e53692e09c4a3ce24eb5dc7e738215c1cd')
sha256sums_aarch64=('d1fdbc11ef7aa977a4eb7d89782d0d2338ddc963440eec71aec72dd1d4d411b5')

package() {
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

