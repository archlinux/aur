#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2024.10.15.e3df9ff
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('x86_64')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('2153f1ea7214f2c200e4aa081eb1351082ff59b7d9a92a73252d5fcbdceee68c')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/phanpy/version

}

