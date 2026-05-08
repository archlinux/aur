# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-awsdocs
pkgver=1.0.0
pkgrel=1
pkgdesc='pi-coding-agent extension for AWS documentation'
arch=('any')
url='https://github.com/dougefresher/pi-ext-awsdocs'
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-markdownify'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-awsdocs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2597d38221e05273b140419f90fef214f3216fc8100ed2f0ce9a9d62e581874')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/awsdocs"
  cp -a "${srcdir}/pi-ext-awsdocs-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/awsdocs/"
}
