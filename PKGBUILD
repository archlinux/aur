# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6d6b84243bfe7428fa94f4d257dee97b15764950d1665983adcaf0aa345370eb')
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('31e057c97c65ffc94a555b3b9bc211c91e1a6adf857af8d74184f03cb6c1c050')

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$srcdir/$name"
  mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
