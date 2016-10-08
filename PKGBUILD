#Maintainer: stefonarch ste at vogliaditerra dot com

_pkgname=black-green
pkgname=black-green-lxqt-theme
pkgver=1.1
pkgrel=1
pkgdesc="Black and green glossy theme for LXQt"
arch=('any')
url="https://github.com/stefonarch/black-green"
license=('CCPL:by-sa')

makedepends=('git')
optdepends=('breeze-icons: Breeze icon themes'
)
provides=("${pkgname}=${pkgver}")
source=("https://github.com/stefonarch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('9248b3c0536e39d4333b6168b5c032a5')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  cp -a --no-preserve='ownership' * "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
}
