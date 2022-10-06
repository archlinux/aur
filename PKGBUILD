# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=0.5.0
_gitname="v${pkgver}"
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
source=("https://github.com/stackabletech/stackablectl/releases/download/${_gitname}/stackablectl-x86_64-unknown-linux-gnu")
b2sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-x86_64-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}
