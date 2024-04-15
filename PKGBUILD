# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-cursors-hyprcursor
pkgver=1.0.0
pkgrel=1
pkgdesc="Hyprcursor port of https://github.com/alvatip/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor"
license=('GPL3')
source=(
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-cursors-hyprcursor.tar.gz"
    "https://github.com/guillaumeboehm/Nordzy-cursors-hyprcursor/releases/download/${pkgver}/Nordzy-cursors-white-hyprcursor.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "8b3f47d997a2dba1d9711e471e5e1a762b0b621e6003c6082a68cc0abeca0c02"
    "80faf7deff6fed660f17a40c90ed650606641ba8a33570632636ef05d89bafa2"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-hyprcursor"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-hyprcursor"

	tar --no-same-owner -zxvf Nordzy-cursors-hyprcursor.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white-hyprcursor.tar.gz -C "${pkgdir}/usr/share/icons/"
}
