# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: alexm-dev <runa-dev@proton.me>

pkgname=runa-bin
_name=runa
pkgver=0.5.11
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
sha256sums_x86_64=('906e355b3683fcfb9a71a466bbb4cc7a397a84f5c691b75cea92553aca74ba95')
sha256sums_aarch64=('3b4b9e5f5b2de6b3619d323e3cb16b0b29072a42e679b4f66b756ede5f317e49')

package() {
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

