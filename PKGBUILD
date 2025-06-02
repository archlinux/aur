# Maintainer: Lars Francke <lars.francke@stackable.tech>

_pkgname=stackablectl
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line tool to interact with a Stackable Data Platform"
arch=('x86_64')
url="https://github.com/stackabletech/stackable-cockpit/"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=("stackablectl-${pkgver}::https://github.com/stackabletech/stackable-cockpit/releases/download/stackablectl-${pkgver}/stackablectl-$CARCH-unknown-linux-gnu")
b2sums=('a767473f1d641ddc3e71818cbb4dca425047fb1664430ab614425a95078c428c7c950ebcc1f1fc7c9e3f775ac372c79f377633348e512a9d222a8d61338dbf7a')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)

package() {
  install -vDm755 "stackablectl-${pkgver}" "$pkgdir/usr/bin/stackablectl"
}

