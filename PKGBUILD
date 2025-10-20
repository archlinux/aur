# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=lact-headless-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Linux GPU Configuration Tool (headless binary release)"
url="https://github.com/ilya-zlobintsev/LACT"
license=('MIT')
arch=('x86_64')
depends=("libdrm" "hwdata")
provides=("lact")
conflicts=("lact")
source=("$url/releases/download/v$pkgver/lact-headless-$pkgver-0.amd64.ubuntu-2404.deb")
sha256sums=('227e77f5e1b78bfbcb059af5321d2ef9f34fd87c677faaa27ff37f75e4602293')

package() {
  ar x lact-headless-$pkgver-0.amd64.ubuntu-2404.deb
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
}
