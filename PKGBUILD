# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-headless-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (headless binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-headless-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('982a02c54f2b0789ed567ab6cc6913c782d82207bd102e8456a25aa3d89f9230')

package() {
  ar x lact-headless-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
