#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2025.01.26.24f03f5
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('x86_64')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('a2cffea786d81f22ae791be6ce99ee63d0babb8d5811621bf39cc257bdac7216')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/phanpy/version

}

