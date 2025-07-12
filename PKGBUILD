# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d3d64939968a9c91353d21e417b414625fd81893f2431e082db29af7e92664b6')
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('fa8a57c924f7186e41bce3257ed649eca5511c26f22b81ccf221482582f81f4e')

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$srcdir/$name"
  mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
