# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>
#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2025.04.26.0d0fa92
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('eb72aa75a6505291ccda911c36f10101dfe43128e58c276fea17cad813e75bd8')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  rm "${pkgdir}"/usr/share/webapps/phanpy/phanpy-dist.tar.gz
}

