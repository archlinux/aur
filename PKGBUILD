# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.name>

pkgname=please-bin
pkgver=17.24.1
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("721e6b9977e8a3f352ab495b5f722a45c9b93a5c2ab8b793561d21ed6b0550d1")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/plz"
}
