# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=0.8.0
_gitname="v${pkgver}"
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/stackabletech/stackablectl/releases/download/${_gitname}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('86a8bd1563073ae8d24e021edc6efbfc84aa195301c692d110dbf13107a9054c394ac4be66375f7a7957a7d6380215733dee36a0b50aaa2d4abcec4cfc02c7b5')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-$CARCH-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}

