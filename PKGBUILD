# Maintainer: Xu Che <chrisxuche (at) gmail (dot) com>

pkgname=gyroflow-ofx-bin
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
pkgdesc="Gyroflow OpenFX plugin"
url="https://github.com/gyroflow/gyroflow-ofx"
license=('GPL3')
depends=( )
makedepends=( )
optdepends=('gyroflow: Export gyroflow project file for the plugin to use.')

source=("${url}/releases/download/v${pkgver}/gyroflow-ofx-linux.zip")
sha512sums=('206a0e2772ae4cf19f0e6f5094f728f8234f8c5642805c784eb5052d9d6235ed76342b6338b9bdbf11ec71f9a55f46df71c75c3041ade5f094275815f878dc85')


package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  mv Gyroflow.ofx.bundle --target-directory="${pkgdir}/usr/OFX/Plugins/"
  ls "${pkgdir}/usr/OFX/Plugins/"
}
