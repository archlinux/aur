# Maintainer: Pieter Goetschalckx

pkgname=nordzy-cursors
pkgver=0.3.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://github.com/alvatip/Nordzy-cursors'
license=('GPL3')
source=(
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
	'7bdb0d16b9f35fb360df416e5335b23e5079435f9b6337b6d03b5fee4c7f9be9'
    '62957e4d66f29058f1ef4e7e45f25d3a3b1d22b2b6081cfb90a348babbd0b6bb'
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/Nordzy-cursors/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/Nordzy-cursors-white/"
}
