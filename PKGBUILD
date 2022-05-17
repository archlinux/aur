#Maintainer: A. Taha Baki <atahabaki@pm.me>

pkgname="vlc-materia-skin"
pkgver="v0.0.1"
pkgrel=1
pkgdesc="Materia Skin for VLC"
arch=('any')
url="https://github.com/atahabaki/materia-vlc"
license=('GPL')
depends=('vlc')
makedepends=('git')
provides=('vlc-materia-skin')
conflicts=('vlc-materia-skin')
source=("https://github.com/atahabaki/materia-vlc/releases/download/${pkgver}/Materia.vlt")
sha512sums=("924d7c954c7f6e4e3792566262c2f0f9a2216e96a370e6f08f8498efd49e0051fa61f4c4df35dc6232ec804e6476fcbf35b70d7235a8b1d7c4e2908d3adc11bf")

package() {
	mkdir -p "${pkgdir}/usr/share/vlc/skins2/"
	install -Dm644 "${srcdir}/Materia.vlt" "${pkgdir}/usr/share/vlc/skins2/"
}
