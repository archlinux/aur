# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=padloc-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="A modern, open source password manager for individuals and teams."
url="https://padloc.app/"
arch=(x86_64)
license=(AGPL3)
depends=()

source=("https://github.com/padloc/padloc/releases/download/v${pkgver}/padloc_${pkgver}_linux_tauri_amd64.deb")
sha256sums=("0ece83fca6d865ae82dd9368e0f0a78e19849d048591ef7568336aaf976e020f")

prepare() {
  tar xf data.tar.gz
}

package() {
  install -d ${pkgdir}/usr/
  cp -r ${srcdir}/usr/* ${pkgdir}/usr/
}
