# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: phils3r <philippseiler1991@web.de>
# Contributor: Simon Steinbeiss
 
pkgname=faenza-xfce-addon
pkgver=0.2.1
pkgrel=4
pkgdesc="Add-On package for the faenza Icon Theme to provide better xfce integration"
url="http://xfce-look.org/content/show.php/Faenza-Xfce?content=142885"
license=('GPL')
arch=('any')
depends=('faenza-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimmerproject/Faenza-Xfce/archive/v.${pkgver}.tar.gz")
sha512sums=('ccc8c7b03ae012d4f977ddb56d69c51b01ec17a8c48370cec0015ee332da62cccebe4fef0b698f8de724b7ee34f5c61d3ef2a0764c922b9db272023cdd754a8a')

package() {
  mkdir -p "${pkgdir}"/usr/share/icons
  mv "${srcdir}"/Faenza-Xfce-v.${pkgver} "${pkgdir}"/usr/share/icons/${pkgname}
}
