#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2025.03.12.4e6820d
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('x86_64')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('eeed32f513189e8d08ade50db695bdec903f9f35356d074ff42a41d19364daea')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/phanpy/version

}

