# Maintainer: Xu Che <chrisxuche (at) gmail (dot) com>

pkgname=gyroflow-ofx-bin
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
pkgdesc="Gyroflow OpenFX plugin"
url="https://github.com/gyroflow/gyroflow-plugins"
license=('GPL3')
depends=( )
makedepends=( )
optdepends=('gyroflow: Export gyroflow project file for the plugin to use.')

source=("${url}/releases/download/v${pkgver}/Gyroflow-OpenFX-linux.zip")
sha512sums=('808bc5f59374040330f0c2c0d5277079efdf0074e4683c3eddd603ec71e0902fcf1cdfdcc80da524996d0eab89ed5cebe01458a1cccd7b07a5954a2fdf5ff545')


package() {
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  mv Gyroflow.ofx.bundle --target-directory="${pkgdir}/usr/OFX/Plugins/"
}
