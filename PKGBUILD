# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.5.9
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python>=3.9.0: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='b735ed90b798eda541885735368930d045430e6e'
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
