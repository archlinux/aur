# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

pkgname=whitesur-icon-theme
_pkgname=WhiteSur-icon-theme
pkgver=2022.11.17
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="MacOS Big Sur like icon theme for linux desktops"
arch=('any')
makedepends=('gtk-update-icon-cache')
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
sha256sums=('ce271980469adb58522adac9da8fbab60d79458e998e2d3e9c5f584852d4315c')

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	install -dm755 "${pkgdir}/usr/share/icons"
	./install.sh -d "${pkgdir}/usr/share/icons"
}
