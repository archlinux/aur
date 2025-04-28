# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>
#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
_pkgver=2025.04.28.5849b4d
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=("https://github.com/cheeaun/phanpy/releases/download/${_pkgver}/phanpy-dist.tar.gz")
sha256sums=('63bb5eff2cb391e9d3aabea6e97632a2d5d9e89bb0e49a868316080c676c4bc4')

package() {
  cd ${srcdir}
  install -d "${pkgdir}"/usr/share/webapps/phanpy/
  cp -r * "${pkgdir}"/usr/share/webapps/phanpy/
  rm "${pkgdir}"/usr/share/webapps/phanpy/phanpy-dist.tar.gz
}

