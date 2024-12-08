#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2024.12.08.7e1ffc5
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('x86_64')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('278f4cf3e21e2797da5b4500baebe95cc2a7ab1a6c3e3b4ba103865649087d4f')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/phanpy/version

}

