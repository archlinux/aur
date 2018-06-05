# Maintainer: Xuanwo <xuanwo.cn#gmail.com>

pkgname=tiresias-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool to help you access your servers."
arch=("x86_64")
url="https://github.com/Xuanwo/tiresias"
license=("Apache")
provides=("tiresias")
source=("https://github.com/Xuanwo/tiresias/releases/download/v${pkgver}/tiresias_v${pkgver}_linux_amd64.tar.gz")
sha256sums=("0348a7b696c3b9a21f6b2323453b17928609e3b6e73b31c112c63cdeeeef405e")


package() {
  # binary
  install -Dm0755 tiresias_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/tiresias"
}
