# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>

pkgname=please-bin
pkgver=16.1.1
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("64a1e2c96d52411e6bd1c8c3ffce642d43fb5bb813c8a6f4074952ddfc5568b2")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
}
