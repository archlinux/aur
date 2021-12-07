# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.6.8
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('67431beafef4a9a4620e53252eeff3a68a9fa2ec453833f89660915efe5c1e7f')
sha256sums_x86_64=('413728425d2dbb13d43c8674f4b0d36cf9897e51d95d6a83918d28c6eb0ebbdf')
sha256sums_i686=('b6b63f1370ddd0ad8f347352ddaecac34718825a7b59e043d5c7bd23c69e64a8')
sha256sums_arm=('7652d8214c1153f28ee46d172035112668f5f142275e99376cff792430421fb9')
sha256sums_aarch64=('02ac047c837825830963c3ddfdebbea6f614c00774baf53750f4b71e81691b60')

package() {
    install -Dm755 "$srcdir/diffsitter-$arch-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

