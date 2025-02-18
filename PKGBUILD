# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='shijima-qt-bin'
__pkgname="shijima"
_pkgname="Shijima-Qt-x86_64.AppImage"
provides=(shijima-qt)
conflicts=(shijima-qt)
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL')
url='https://github.com/pixelomer/Shijima-Qt-releases'
depends=(
  'qt6-base'
  'qt6-multimedia'
)
makedepends=("fuse3"
)
source=("https://github.com/pixelomer/Shijima-Qt-releases/releases/download/v"${pkgver}"/release-linux-x86_64.zip")
sha256sums=('14cbbc6b7c5280cb0f7ae9db2ef322df7da46a48f52a70b7d1287ecdb4f001a8')
package() {
install -d "${pkgdir}"/usr/share/"${_pkgname}"/"${_pkgdir}" "${pkgdir}/usr/bin"
cp -r "${_pkgname}" "${pkgdir}"/usr/bin/"${__pkgname}"

}
sha256sums=('14cbbc6b7c5280cb0f7ae9db2ef322df7da46a48f52a70b7d1287ecdb4f001a8')
sha256sums=('5e130677625fa346d7204e9bc1d774432168f5bf19138999b52745c72c9c540e')
