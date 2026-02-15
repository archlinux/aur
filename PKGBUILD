# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.7.1
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='856f6f27dfa48ee1ac8d7ec40333e3f892458067'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('051b9a6db7e97589f37c387fe68143722e36fff9e68d06af9d798e16d692bb5a')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
}
