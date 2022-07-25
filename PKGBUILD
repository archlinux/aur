# Maintainer: James Bulmer <me@nekinie.com>
# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.com>

pkgname=please-bin
pkgver=16.21.3
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("57783698bdd3d5171b7811fea27806f9eef64ef4a7baefe5d81d2767e83fd913")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/plz"
}
