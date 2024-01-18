# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Nico <d3sox at protonmail dot com>

pkgname=whitesur-icon-theme
_pkgname=WhiteSur-icon-theme
pkgver=2023.07.03
_pkgver="${pkgver//./-}"
pkgrel=2
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
sha256sums=('49f798b61bf253ef3b587f245a310f0a2e268c28a3397324272a15c2e7088bf4')

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	install -dm755 "${pkgdir}/usr/share/icons"
	./install.sh -d "${pkgdir}/usr/share/icons"
}
