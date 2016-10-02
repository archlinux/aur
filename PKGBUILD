#Maintainer: stefonarch ste at vogliaditerra dot com

_pkgname=archlinux-dark
pkgname=archlinux-lxqt-theme
pkgver=1.1
pkgrel=1
pkgdesc="Dark Arch linux theme for the LXQt Desktop"
arch=('any')
url="https://github.com/stefonarch/archlinux-lxqt-theme"
license=('CCPL:by-sa')

depends=('')
makedepends=('git')
optdepends=('breeze-icons: Breeze icon themes'
            )
provides=("${pkgname}=${pkgver}")
source=("https://github.com/stefonarch/archlinux-lxqt-theme/archive/${pkgver}.tar.gz")
md5sums=('27cbf712f06713b36b77a8b08835bdb4')

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  cp -a --no-preserve='ownership' * "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
}