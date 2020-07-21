# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.4.4
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python>=3.9.0: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='e6d6927ff1dfc7f7b1be1be09195fd371bf67edb'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cp -r usr "${pkgdir}"
}
