# Maintainer: Goodarz <1831847+a-goodarzi@users.noreply.github.com>

_pkgname=jottr
pkgname=${_pkgname}-bin
pkgver=2.2.1
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
  'ffe53ae76083fc96bfa776e005980a8d6694b55b8b83caeb1ae199fd2f122b30'
)

package() {
  cd "${pkgdir}"

  tar -xf "${srcdir}/data.tar.xz"
}
