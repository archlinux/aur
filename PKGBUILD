# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.4.9
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python>=3.9.0: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='527ea7589f3ea0bd6dfcfe1d68447a76c3d88dbd'
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
