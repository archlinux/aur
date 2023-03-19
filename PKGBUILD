# Maintainer: Pieter Goetschalckx

pkgname=nordzy-cursors
pkgver=0.6.0
pkgrel=1
pkgdesc='Cursor theme using the Nord color palette and based on Vimix and cz-Viator'
arch=(any)
url='https://github.com/alvatip/Nordzy-cursors'
license=('GPL3')
source=(
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-white.tar.gz"
	"https://github.com/alvatip/Nordzy-cursors/releases/download/v${pkgver}/Nordzy-cursors-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
b2sums=('1758d72564c6a310e9870157a57b48fe30a6670a13c763b69e1ab7b99d618fbc474005c52f1080a1433e7ed5f2dd815abd19709ca15d1c3ce079794427b23264'
        'c06236a544743b98cc48b37bfcf566bfb92c2a2088014b0bb8a954cb5c8a73db0a5c8fef20737bc0a3725f52038103133b5e7c2ff69ceac1bb04021c55804e2d'
        'f6ecfb34fa3bdfb9777e503cc320daa822811e7f302ce2e2c06844b85d3859282f344a0ca7bbfa772a0e73038a803bf0c459b2f5840b5945a8e412ea18a1c557')

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-cursors-lefthand"

	tar --no-same-owner -zxvf Nordzy-cursors.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-white.tar.gz -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf Nordzy-cursors-lefthand.tar.gz -C "${pkgdir}/usr/share/icons/"
}
