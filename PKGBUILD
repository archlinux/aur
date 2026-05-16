# Maintainer: Goodarz <1831847+a-goodarzi@users.noreply.github.com>

_pkgname=jottr
pkgname=${_pkgname}-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='Simple text editor for writers, journalists and researchers'
arch=('x86_64')
url="https://github.com/mfat/jottr"
license=('GPL-3.0-only')
depends=(
  'bash'
  'hicolor-icon-theme'
  'python'
  'python-feedparser'
  'python-pyenchant'
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-pyxdg'
  'python-requests'
  'qt5-svg'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=(
  'f4b6d3493eeccaf9ec66ace04f01ff71a789ce26b5f1d176caf7fa15355fa312'
)

package() {
  cd "${pkgdir}"

  tar -xf "${srcdir}/data.tar.xz"
}
