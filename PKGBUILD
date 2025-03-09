# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.6.7
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='5bd94d3ffdb9585c09832f0beabb14f0e67e8d58'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('66579cbcc0b1c0d4df974f703325215f4bd34431c38102e1e69539dac0a4db73')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
}
