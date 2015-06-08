#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.1.0_rc4
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
noextract=("OpeneCardApp-${_pkgver}.jar")
source=("https://www.openecard.org/fileadmin/openecard-files/downloads/OpeneCardApp-${_pkgver}.jar" "openecardapp")
sha256sums=('d5b983018a5ce64a9a0baf6c72cb6ca486734afe458a1bcf312629d8bed5f12d'
            '57996ed4c29221efc903a64038217ac4ec67e00950f99dd421ac0fef3b770d74')

package() {
	install -D -m755 "openecardapp"               "${pkgdir}/usr/bin/openecardapp"
	install -D -m644 "OpeneCardApp-${_pkgver}.jar" "${pkgdir}/usr/share/java/openecardapp/OpeneCardApp.jar"
}
