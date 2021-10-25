# Maintainer: Matthew Geskey <vitrvvivs.architectus@gmail.com>

pkgname=oasis-node
pkgver=21.3.3
pkgrel=1
pkgdesc="Node for Oasis Network blockchain"
arch=('any')
url=https://github.com/oasisprotocol/oasis-core
source=("https://github.com/oasisprotocol/oasis-core/releases/download/v${pkgver}/oasis_core_${pkgver}_linux_amd64.tar.gz")
md5sums=('7902f446a765499f41dd92b486c20194')
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

