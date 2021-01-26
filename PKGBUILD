# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>

pkgname=please-bin
pkgver=15.12.0
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("6c6ddccf0559347dc371fbc017375832357d0a647adb8192182322215bb84ab4")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
}
