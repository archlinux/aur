#Maintainer: stefonarch ste at vogliaditerra dot com

_pkgname=silver
pkgname=silver-lxqt-theme
pkgver=1.1
pkgrel=1
pkgdesc="Silver theme for the LXQt Desktop"
arch=('any')
url="https://github.com/stefonarch/silver"
license=('CCPL:by-sa')

depends=('')
makedepends=('git')
optdepends=('breeze-icons: Breeze icon themes'
            )
provides=("${pkgname}=${pkgver}")
source=("https://github.com/stefonarch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b4ed8ed1648ce08b4b62797563f794ab')

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  cp -a --no-preserve='ownership' * "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
}