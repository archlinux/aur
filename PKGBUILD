# Maintainer: demir <iron-actress-music@duck.com>

pkgname=mergiraf-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats."
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPL-3.0-or-later')
provides=('mergiraf')
conflicts=('mergiraf')
depends=(
  'glibc'
  'gcc-libs'
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/mergiraf/mergiraf/releases/download/v${pkgver}/mergiraf_${arch}-unknown-linux-gnu.tar.gz")
sha512sums=('89f518df4a93b97ac8dd5f5a2b3ec2c9649c3093deb07fbf99ecdd9b1e4175748a0ba5c9e92a518fe825bead5c8f9ff521aeda5ece19e164f5c6f6ebd60cb98d')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp mergiraf ${pkgdir}/usr/bin/mergiraf
}
