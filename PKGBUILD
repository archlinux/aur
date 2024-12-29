#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2024.12.28.119d4b0
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('x86_64')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('f44da1afe7f485f35e499704add9b811920e8f91beedfb6a838cc987f9857144')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/phanpy/version

}

