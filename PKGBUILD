# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.name>

pkgname=please-bin
pkgver=17.31.2
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("91d44b0247040462a873a689c30323fd40df12bae369b5b9dd832b73e7ffced8")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/plz"
}
