# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>

pkgname=please-bin
pkgver=15.4.1
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("b78ad87f52af5b6fd7030159fb53df87ced1a31f509a6a29e7a050b312e756ea")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
}
