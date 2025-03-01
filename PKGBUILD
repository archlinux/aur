# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-headless-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (headless binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-headless-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('cc6fa6c11671eb18bf33c69e669fa5a33db4f030000c5c74125750af8ff54db4')

package() {
  ar x lact-headless-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
