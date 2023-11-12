# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=onboard-layout-zhuyin
pkgver=r33.3aad517
pkgrel=1
pkgdesc="Zhuyin Keyboard Layout for onboard"
url="https://github.com/andyching168/onboard-layout-zhuyin"
arch=('any')
license=('GPL3')
depends=('onboard')
#makedepends=('git')
_commit=3aad517673bd8edb15dd7b725a668e20181ea6da
_path=usr/share/onboard/layouts
source=("$url/raw/$_commit/$_path/zhuyin-Alpha.svg"
        "$url/raw/$_commit/$_path/zhuyin-Numbers.svg"
        "$url/raw/$_commit/$_path/zhuyin-Utils.svg"
        "$url/raw/$_commit/$_path/zhuyin.onboard")
sha256sums=('7ddaa259626c654b66b792153b6d0296c007f89a19793304e12f691a3d55e21e'
            'd39553ee2f455baf4cee307554f5fce2101d7cad1fa9d5f3096b2198057aad36'
            '866c53d1d7c6e128aeb5e8715ee547b1c9d7f83cd1a767a4c0cde8f4cab37493'
            '5899f21e1a7729601a2a59a32f432fa4d27f7fdaf834d25929d15c7756142337')
#source=("git+$url.git")
#sha256sums=('SKIP')

#pkgver() {
#  cd $pkgname
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
  mkdir -p "$pkgdir/$_path"
  install -Dm644 zhuyin-*.svg zhuyin.onboard "$pkgdir/$_path"
}
