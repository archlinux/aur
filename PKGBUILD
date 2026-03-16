# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
# We moved to epoch=1 because we moved from CalVer to SemVer
epoch=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("stackablectl-${pkgver}::https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('9b39871f96ca765c8312499628d1315abe7f8194fc08bf7d53c72268fd779d1f51dc01c83fd4d0810dc9fccd299485f2828f80b1e068725e29bef2ad22aeacba')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)

package() {
  install -vDm755 "stackablectl-${pkgver}" "$pkgdir/usr/bin/stackablectl"
}

