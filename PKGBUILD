# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('2eea9cd244dd952d3d2c13a053fefabfb11c7c14950f835ff0e5c46a71b71b54')

package() {
  install -Dm 755 "$srcdir/jb-linux-amd64" "$pkgdir/usr/bin/jb"
}
