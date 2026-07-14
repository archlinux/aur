# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-awsdocs
pkgver=1.1.0
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
sha256sums=('b4e16f4f867173674e6a30fbde0a1f42fc204876d6cbfc53e6ca3c409a795816')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/awsdocs"
  cp -a "${srcdir}/pi-ext-awsdocs-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/awsdocs/"
}
