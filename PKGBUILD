# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=24.11.3
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("stackablectl-${pkgver}::https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('6b66c6200d10447248f99220612bf420d688dd76a8ff276bd008e2553292fdd5b363a5bd877d79034ab752501635e98e8b05983f2fbf3c91670d8381f70517b6')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)

package() {
  install -vDm755 "stackablectl-${pkgver}" "$pkgdir/usr/bin/stackablectl"
}

