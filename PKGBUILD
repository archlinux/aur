# Maintainer: Maykel Moya <mmoya at mmoya dot org>
pkgname="mozlz4-bin"
pkgdesc="Decompress / compress mozlz4 files"
pkgver=0.1.0
pkgrel=1
arch=("x86_64")
url="https://github.com/jusw85/mozlz4"
license=("MIT")
source=("${url}/releases/download/v${pkgver}/mozlz4-linux")
sha256sums=("a3322743644daade9a4ec103de582f1f6e9a17b25aae1f62f3181e2e51b9bd0a")

package() {
  install -D -m755 mozlz4-linux "$pkgdir/usr/bin/mozlz4"
}
