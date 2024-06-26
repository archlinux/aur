# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=24.3.6
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('7408e9603a1a9e69422a221117f25e91eec18c226c388c1439078d41dad21f0ff7a9cdd4600d5bc42cec18047c5cfc679e4cf0f0dedc159c8370432d3f9125f6')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-$CARCH-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}
