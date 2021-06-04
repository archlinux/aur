# Maintainer: Matthew Geskey <vitrvvivs.architectus@gmail.com>

pkgname=oasis-node
pkgver=21.1.2
pkgrel=1
pkgdesc="Node for Oasis Network blockchain"
arch=('any')
url=https://github.com/oasisprotocol/oasis-core
source=('https://github.com/oasisprotocol/oasis-core/releases/download/v21.1.2/oasis_core_21.1.2_linux_amd64.tar.gz')
md5sums=('6215fb89220e171400c7d85ae82a5096')
depends=()
makedepends=()
provides=('oasis-node')

package() {
  cd "$srcdir/oasis_core_${pkgver}_linux_amd64"

  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm755 oasis-node -t"$pkgdir/usr/bin/"
  install -Dm755 oasis-net-runner -t"$pkgdir/usr/bin/"
  install -Dm755 oasis-remote-signer -t"$pkgdir/usr/bin/"
  install -Dm755 oasis-core-runtime-loader -t"$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:

