# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=1.5.3
pkgrel=1
# We moved to epoch=1 because we moved from CalVer to SemVer
epoch=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackablectl/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("stackablectl-${pkgver}::https://github.com/stackabletech/stackablectl/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('35b5d11f4c5c96f04e0dd8ea177bc9a54dae14cb36179bbf53807868dea83a0904338f006799b273a8d8bc84ad1453bb336db4b79cd9a9e504d71f7a214bf63c')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)

package() {
  install -vDm755 "stackablectl-${pkgver}" "$pkgdir/usr/bin/stackablectl"
}

