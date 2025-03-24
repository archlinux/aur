# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-hyprcursors
pkgver=2.4.0
pkgrel=1
pkgdesc="Hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-cursors"
license=('GPL3')
source=(
    "Nordzy-hyprcursors_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors.tar.gz"
    "Nordzy-hyprcursors-white_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-white.tar.gz"
    "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-lefthand.tar.gz"
    "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Nordzy-hyprcursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "d13767cd6d4757ddc3722e407d7a5f3422a4e4cce231495b7cf4d1be3e7a8b35"
    "81d82bd012c1b76a48e1026f1fdb5a66bc9374fb1c6cad64530d3d1b6b14711e"
    "52994efc2e01263781e1a14fd1f223d08239314b9647edee8cefc321be1bd688"
    "858cfffae8c92bb8816e172881a5dd1bbbebdf3cf5833cb6befa104211177f00"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white-lefthand"

	tar --no-same-owner -zxvf "Nordzy-hyprcursors_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
}
