# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=1.5.1
pkgrel=1
# We moved to epoch=1 because we moved from CalVer to SemVer
epoch=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("stackablectl-${pkgver}::https://github.com/stackabletech/stackablectl/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('e53e9b67640323f7615fca52598bfeb0021d82c51232debda8affd285718fcbf9da0111234826138e1a60fcdb33a3a3aa1e73bb1e26444205b82cea30793733b')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)

package() {
  install -vDm755 "stackablectl-${pkgver}" "$pkgdir/usr/bin/stackablectl"
}

