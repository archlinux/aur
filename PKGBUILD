# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-awsdocs
pkgver=0.1.2
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
sha256sums=('42674cfc0f0f6190d93b9e8ae6d5e85f2fbb04e12aee629097c0ce1a82be9477')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/awsdocs"
  cp -a "${srcdir}/pi-ext-awsdocs-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/awsdocs/"
}
