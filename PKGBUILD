#Maintainer: stefonarch ste at vogliaditerra dot com

_pkgname=black-red
pkgname=black-red-lxqt-theme
pkgver=1.1
pkgrel=1
pkgdesc="Black and red glossy theme for LXQt"
arch=('any')
url="https://github.com/stefonarch/black-red"
license=('CCPL:by-sa')

makedepends=('git')
optdepends=('breeze-icons: Breeze icon themes'
)
provides=("${pkgname}=${pkgver}")
source=("https://github.com/stefonarch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('02557d5652ab62bcc159c7a806b4a130')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  cp -a --no-preserve='ownership' * "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
}
