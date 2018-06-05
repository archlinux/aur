# Maintainer: Xuanwo <xuanwo.cn#gmail.com>

pkgname=tiresias-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to help you access your servers."
arch=("x86_64")
url="https://github.com/Xuanwo/tiresias"
license=("Apache")
provides=("tiresias")
source=("https://github.com/Xuanwo/tiresias/releases/download/v${pkgver}/tiresias_v${pkgver}_linux_amd64.tar.gz")
sha256sums=("0e7054cc0c1aa747ae29e844085e8e8c7769d11af970e2d8234dc4a1a17cf004")


package() {
  # binary
  install -Dm0755 tiresias_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/tiresias"
}
