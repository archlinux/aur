# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.6.8
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='d135f29d688d89a0e7b48acec9e08738c7976ee1'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('627ffc91f483fda8b8747429a64582e36e4004b2585faad60a146a19eaae2b0f')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
}
