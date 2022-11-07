# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=0.6.0
_gitname="v${pkgver}"
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/stackabletech/stackablectl/releases/download/${_gitname}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('468ad0807fe47173737d94ea658e1d0b3cbd49a54edec78b34e6b098a0ffd9ce2023cad84399580127bcacacd2c29b62f6b5596329baf6dba1dd2f89b895c5b8')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-$CARCH-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}

