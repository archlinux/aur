# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

appname=rover
pkgname=rover-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Interactive Terraform visualization. State and configuration explorer."
arch=('x86_64')
url="https://github.com/im2nguyen/rover"
license=('MIT')
source=("${appname}_${pkgver}_linux_amd64.zip::https://github.com/im2nguyen/${appname}/releases/download/v${pkgver}/${appname}_${pkgver}_linux_amd64.zip")
sha256sums=('f296a3c87558291fc28205172c5856239d28f4112c2c3d42595af3bb62acce83')

package() {
  cd "${srcdir}"
  install -Dm755 ${appname}_v${pkgver} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
