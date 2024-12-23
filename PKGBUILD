# Maintainer: Xu Che <chrisxuche (at) gmail (dot) com>

pkgname=gyroflow-ofx-bin
pkgver=2.0.2
pkgrel=1
arch=('x86_64')
pkgdesc="Gyroflow OpenFX plugin"
url="https://github.com/gyroflow/gyroflow-plugins"
license=('GPL3')
depends=( )
makedepends=( )
optdepends=('gyroflow: Export gyroflow project file for the plugin to use.')

source=("${url}/releases/download/v${pkgver}/Gyroflow-OpenFX-linux.zip")
sha512sums=('fe0edbe683b3770c721c8b5686ac7084a88062c44f9b8436aa73bd5c255e130ad60d80fb02941ad30dff379e78739986c4df5ac7e1dc7134fcd5b3fb477d11b6')


package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  mv Gyroflow.ofx.bundle --target-directory="${pkgdir}/usr/OFX/Plugins/"
  ls "${pkgdir}/usr/OFX/Plugins/"
}
