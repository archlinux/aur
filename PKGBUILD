# Maintainer: Pieter Goetschalckx

pkgname=nordzy-cursors
pkgver=2.3.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://github.com/alvatip/Nordzy-cursors'
license=('GPL3')
source=(
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-lefthand.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
b2sums=('448b62c5d71274291fc9d023766d3db4c50f9081f18066e25e6b431af64040469d2c31686c7a2da88422c6fa859e55263faa534e8156cb537057e15fd8cc85b5'
        'e86ad90777beced288d7eb11d8b6c58354925d4da0776a1c3e0a99eb651389b211fe3200efeee5a1cd1926bc5643d87220924d910a74fa9cd52d6f3eb61df96e'
        '62b2e100160f3bdfff34d32431e8726e26174f452354b43d41248b898aed93690529d40c35ec15ee3a432e2bce112f16ad5ced8cc66044b910efbee2f72c62a2'
        'f3cbf8d2630d0017ff240885029324083e58cb8cf6128b1a38b0952d18cf06872c52d92a0a13bb7ac08973790543c96e058993f4a370bb2f6fc379804f91b0c0')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white-lefthand"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
}
