# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.6.1
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python>=3.9.0: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='ebab2114649cc688a05e30857f6706f16fe82307'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
}
