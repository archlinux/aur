# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=23.11.3
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('bfda7fe55ad2ca53674d6e4d8788ffe3ddc335bbbbaec55f5ad0d87d04e592ce415000a260d1ccde82167d62b49d9c90ab187e4e6bacb3d251fb3fccd217fd3a')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-$CARCH-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}
