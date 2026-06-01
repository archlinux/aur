# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-awsdocs
pkgver=1.0.1
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
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
install='pi-ext.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dougefresher/pi-ext-awsdocs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64e299287a439722948ab8e0cf49794ccbb6e6c65cbae953d5944469285c09f6')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/awsdocs"
  cp -a "${srcdir}/pi-ext-awsdocs-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/awsdocs/"
}
