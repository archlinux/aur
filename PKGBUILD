# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>

pkgname=please-bin
pkgver=14.3.11
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("ff2fe00cbd51f964009180113f64a210b0b02930270f390345a4f6250895beb8")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
}
