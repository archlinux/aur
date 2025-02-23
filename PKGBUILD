# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='shijima-qt'
_pkgname="shijima"
pkgver='0.0.2'
pkgrel='2'
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
md5sums=('b2df4dd1f546eb66c15a8f2224caf9e6')

package() {
install -d "${pkgdir}"/usr/share/"${_pkgname}"/"${_pkgdir}" "${pkgdir}/usr/bin"
cp -r "${pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"

}
