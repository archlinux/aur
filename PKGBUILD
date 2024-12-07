# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "gtk4" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('891417f110fe0ad61846af06d15c7054d2a5e32d7fef76bb0c5b94426911f1a3')

package() {
  ar x lact-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
