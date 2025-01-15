# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "gtk4" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('167ecf9d74720fadd8de0555b3b28ca421ddbd41de3ca4449cbbb9310b3cf8bb')

package() {
  ar x lact-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
