# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-headless-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (headless binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-headless-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('c1c9d2da34fd9ff53aba005e9b1637d6a0d2940272db19800b0b316b8c870a5d')

package() {
  ar x lact-headless-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
