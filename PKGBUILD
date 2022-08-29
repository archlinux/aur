# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=padloc-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="A modern, open source password manager for individuals and teams."
url="https://padloc.app/"
arch=(x86_64)
license=(AGPL3)
depends=()

source=("https://github.com/padloc/padloc/releases/download/v${pkgver}/padloc_${pkgver}_linux_tauri_amd64.deb")
sha256sums=("7525032554e1edc9676da967147f3211d0a6e6bf725205895b368a8c0fd52f4b")

prepare() {
  tar xf data.tar.gz
}

package() {
  install -d ${pkgdir}/usr/
  cp -r ${srcdir}/usr/* ${pkgdir}/usr/
}
