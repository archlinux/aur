# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=autohosts
pkgver=3.0.1
pkgrel=1
pkgdesc="Automate hosts file updates on Linux and MacOS. Block Firefox telemetry, Google snooping and web trackers at the root"
arch=('any')
url='https://github.com/angela-d/autohosts'
license=('GPL2')
depends=('bash')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/angela-d/autohosts/releases/download/${pkgver}/autohosts.deb")
sha256sums=('e3016fd00d9cf4cca44e7e7c435f5f6ec1526d043567408ab8593da42fda701a')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  rm "${pkgdir}/usr/share/doc/autohosts/copyright"
}