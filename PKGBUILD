# Maintainer: Michael Berlinger <michaelmberlinger@gmail.com>

pkgname=gooseberry-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Knowledge Base for the Lazy"
url='https://github.com/out-of-cheese-error/gooseberry'
arch=('i686' 'x86_64')
license=('Apache')
depends=()
optdepends=('bat: display highlighted markdown in the terminal')
provides=('gooseberry')
source=("https://github.com/out-of-cheese-error/gooseberry/releases/download/$pkgver/gooseberry-linux.tar.gz")
sha256sums=('ed3206b70627b6d54396f3dc02c6f80fe93ad8b1c1639f7a11c83bdde192858a')

package() {
  cd "$srcdir/"

  install -Dm755 gooseberry "${pkgdir}/usr/bin/gooseberry"
}
