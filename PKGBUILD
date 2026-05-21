# Maintainer: Stephan van Stekelenburg <stephan@hayman.io>
pkgname=hypr-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Customizable git worktree manager'
arch=('x86_64' 'aarch64')
url="https://github.com/Stephanvs/hypr"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('hypr')
conflicts=('hypr')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/Stephanvs/hypr/releases/download/v$pkgver/hypr-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/Stephanvs/hypr/releases/download/v$pkgver/hypr-linux-arm64.tar.gz")
sha256sums_x86_64=('5ce8663b1b32b433883d9ee90b3290f26a3a55e5fd24ae23cdfa915cac018842')
sha256sums_aarch64=('ac57df319ab5c4607a16497b78e06b85bd6cd7baf49b4fafe8e22c9a36de9047')

package() {
  install -Dm755 "$srcdir/hypr" "$pkgdir/usr/bin/hypr"
}
