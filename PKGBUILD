# Maintainer: Anyrow <oss@anyrow.ai>
pkgname=anyrow
pkgver=1.0.0
pkgrel=1
pkgdesc="AI-native document extraction CLI"
arch=('x86_64' 'aarch64')
url="https://anyrow.ai"
license=('MIT')
source_x86_64=("https://github.com/anyrow/cli/releases/download/v1.0.0/anyrow_1.0.0_linux_amd64.tar.gz")
source_aarch64=("https://github.com/anyrow/cli/releases/download/v1.0.0/anyrow_1.0.0_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
package() {
    install -Dm755 "$srcdir/anyrow" "$pkgdir/usr/bin/anyrow"
}
