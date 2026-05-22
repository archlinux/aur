# Maintainer: Goodarz <1831847+a-goodarzi@users.noreply.github.com>

_pkgname=jottr
pkgname=${_pkgname}-bin
pkgver=2.1.1
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
  '67e7893a441b019b0898b52078565d29c52cd98114301a806d66e8536dbe74b1'
)

package() {
  cd "${pkgdir}"

  tar -xf "${srcdir}/data.tar.xz"
}
