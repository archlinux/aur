# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=v1.2.1
pkgrel=2
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/releases/download/${pkgver}/gdu-linux-amd64.tgz")
sha256sums=('ac20974ca835626091f376e32a603af219ac0e034449740f2844ff4cc0decfc2')

package() {
  cd "$srcdir"
  install -Dm755 gdu-linux-amd64 "${pkgdir}"/usr/bin/$pkgname
}

