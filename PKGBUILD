# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-headless-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (headless binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-headless-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('8721a6c468077b18704845ddd6a59f20761b0b72bfcd0490dbf253ede8e87308')

package() {
  ar x lact-headless-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
