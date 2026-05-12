# Maintainer: Thomas Butler <goliyth@gmail.com>
pkgname=fnclaude-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A claude CLI launcher with quality-of-life features (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/fnrhombus/fnclaude"
license=('MIT')
provides=('fnclaude')
conflicts=('fnclaude')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/fnrhombus/fnclaude/releases/download/v$pkgver/fnclaude_Linux_arm64.tar.gz")
sha256sums_x86_64=('eb43f4a173a98598693b04a09677509c5bcc3e86fcec2a058b3482a88c8a5ac9')
sha256sums_aarch64=('8f49b61851de72f43c53bb4748955039a1ef3a3fd32414b28eac02cfc6dff321')

package() {
    install -Dm755 fnclaude "$pkgdir/usr/bin/fnclaude"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
