# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

_pkgname=WhiteSur-icon-theme
_pkgver=2021-10-13

pkgname=whitesur-icon-theme
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="MacOS Big Sur like icon theme for linux desktops"
arch=('any')
optdepends=(
  'whitesur-gtk-theme: Recommended GTK theme'
  'whitesur-kde-theme: Recommended KDE theme'
  'whitesur-cursor-theme: Recommended cursor theme'
)
conflicts=("${pkgname}-git")
license=('GPL3')
url="https://github.com/vinceliuice/WhiteSur-icon-theme"
options=('!strip')
source=("${_pkgname}-${_pkgver}.tar.gz"::"${url}/archive/${_pkgver}.tar.gz")
sha256sums=('51b6f0f078036e85367c28d1da601449c66ccc202155c7d29726eca719cb0e39')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh -d "${pkgdir}/usr/share/icons"
}
