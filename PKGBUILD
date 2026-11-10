# Maintainer: Xu Che <chrisxuche (at) gmail (dot) com>

pkgname=gyroflow-ofx-bin
pkgver=3.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Gyroflow OpenFX plugin"
url="https://github.com/gyroflow/gyroflow-plugins"
license=('GPL3')
depends=('glibc' 'libgcc' 'libglvnd')
makedepends=( )
optdepends=('gyroflow: Export gyroflow project file for the plugin to use.')
options=('!debug')

source=("${url}/releases/download/v${pkgver}/Gyroflow-OpenFX-linux.zip")
sha512sums=('e1d41873252bc4a9e2f92e2224ad393ce85ca777477580f1ffd957c698aaad14a845d20dd67a228e173122807dfe8ecc65125000627c95b45568f00e164ad0bb')


package() {
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  mv Gyroflow.ofx.bundle --target-directory="${pkgdir}/usr/OFX/Plugins/"
}
