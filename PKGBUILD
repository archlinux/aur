# Maintainer: Henry Jenkins <archlinux.org@henryjenkins.name>

pkgname=please-bin
pkgver=17.33.0
pkgrel=1
pkgdesc="A cross-language build system with an emphasis on high performance, extensibility and reproduceability"
arch=("x86_64")
url="https://please.build/"
license=("Apache")
source_x86_64=("https://github.com/thought-machine/please/releases/download/v${pkgver}/please_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=("124248ba5c9eee6f689a5b91a940b87b87db3b920b11f466b2375164d2c7cee2")

package() {
  install -d "${pkgdir}/opt/thought-machine"
  install -d "${pkgdir}/usr/bin"

  cp -r "${srcdir}/please" "${pkgdir}/opt/thought-machine"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/please"
  ln -s /opt/thought-machine/please/please "${pkgdir}/usr/bin/plz"
}
