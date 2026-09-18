# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.x86_64.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('863063e53f9773000443c10b648cf3bdccebbbcf9c4871f9ceea7681a8c80395')
source_aarch64=("${pkgname}-${pkgver}.aarch64.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('4809282e7a0702603c628a405e200fbdef800f7a945dcba2815ff76670a377ff')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/$name"
    mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
