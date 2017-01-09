# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=tiling
pkgver=2.0.0
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="http://kde-look.org/content/show.php?content=161151"
license=('GPL')
depends=('kwin')
source=("https://dl.opendesktop.org/api/files/download/id/1483622436/${_pkgname}.kwinscript")
md5sums=('0936f697a1b05da8884ed3b09f6eb10e')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${pkgname}"
  cp -r "${srcdir}"/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${pkgname}"
  install -Dm644 "${srcdir}/metadata.desktop" "${pkgdir}/usr/share/kservices5/${pkgname}.desktop"
}
