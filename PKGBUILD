# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>
#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2025.03.22.85d964f
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('17c052e523c48ed7077a602da78135688ec9d32bd2bad33f685b6e0fce1c39e1')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  rm "${pkgdir}"/usr/share/webapps/phanpy/phanpy-dist.tar.gz
}

