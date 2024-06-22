# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.6.3
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python: Nemo extension'
            'python-caja: Caja extension')
makedepends=('git')
_commit='35aa5b9839935fc3415ba6b7c77171459e7325fa'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('df4603a3df081fd51b75f585ea1a57843991b3742890af215233302a896d3696')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  cp -r usr "${pkgdir}"
}
