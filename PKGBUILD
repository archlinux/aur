# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=pacnews-neovim
pkgver=0.0.2
pkgrel=1
pkgdesc="Find .pacnew files and merge them with neovim diff"
arch=(any)
url="demizerone.com"
license=('unknown')
makedepends=('git')
provides=('pacnews')
conflicts=('pacnews-git')
source=("pacnews")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  install pacnews "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
