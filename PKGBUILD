# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

pkgname=whitesur-icon-theme
_pkgname=WhiteSur-icon-theme
pkgver=2026.07.07
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
license=('GPL-3.0-only')
url="https://github.com/vinceliuice/WhiteSur-icon-theme"
options=('!strip')
source=("${_pkgname}-${_pkgver}.tar.gz"::"${url}/archive/${_pkgver}.tar.gz")
sha256sums=('ffb70b9007131a0011dc14aa07bb4a6cac54973ea7cbcebd222fd7e470aee97c')

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	install -dm755 "${pkgdir}/usr/share/icons"
	./install.sh -d "${pkgdir}/usr/share/icons"
}
