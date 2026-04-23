# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-awsdocs
pkgver=0.1.3
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
sha256sums=('15b96db2e2206c73408147609ab3492d5e94ac41010b081d22d77f3df2100589')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/awsdocs"
  cp -a "${srcdir}/pi-ext-awsdocs-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/awsdocs/"
}
