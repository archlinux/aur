# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=24.7.1
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('cd2cfd3397bb6cf5b92ed984fbb5e96366c7a5663f7531a37816a708ed9e1a9c3f608ec8361e43e38323c17597da4e48e1d853c0113a83924d9b1703366872bb')
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  mv stackablectl-$CARCH-unknown-linux-gnu stackablectl
  install -vDm755 -t "$pkgdir/usr/bin/" stackablectl
}
