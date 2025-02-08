# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>



pkgname='shijima-qt-bin'
__pkgname="shijima"
_pkgname="Shijima-Qt-x86_64.AppImage"
provides=(shijima-qt)
conflicts=(shijima-qt)
pkgver='0.0.1'
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL')
url='https://github.com/pixelomer/Shijima-Qt-releases'
depends=(
  'qt6-base'
  'qt6-multimedia'
)
makedeps=("fuse3"
)
source=("https://github.com/pixelomer/Shijima-Qt-releases/releases/download/v"${pkgver}"/release-linux-x86_64.zip")
sha256sums=('14cbbc6b7c5280cb0f7ae9db2ef322df7da46a48f52a70b7d1287ecdb4f001a8')
package() {
install -d "${pkgdir}"/usr/share/"${_pkgname}"/"${_pkgdir}" "${pkgdir}/usr/bin"
cp -r "${_pkgname}" "${pkgdir}"/usr/bin/"${__pkgname}"

}
