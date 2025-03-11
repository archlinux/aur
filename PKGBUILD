# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='shijima-qt'
_pkgname="shijima"
pkgver='0.0.3'
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL')
url='https://github.com/pixelomer/Shijima-Qt'
depends=(
  'qt6-base'
  'qt6-multimedia'
  'libunarr'
)
source=("https://github.com/pixelomer/Shijima-Qt/releases/download/v"${pkgver}"/release-linux-x86_64.zip")
md5sums=('3895502a7ac2d463e43e46ff1bdd4deb')

package() {
        install -d "${pkgdir}"/usr/share/"${_pkgname}"/"${_pkgdir}" "${pkgdir}/usr/bin"
	cp -r "${pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
	cd ..
	install -Dm644 "${_pkgname}".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${_pkgname}".png "${pkgdir}/usr/share/icons/${pkgname}.png"
	}
