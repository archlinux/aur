# Maintainer: meerkat-b <noreply@github.com>
pkgname=portago
pkgver=0.0.4
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/portago"
license=('GPL-3.0-only')
depends=('glibc')
source=("https://github.com/meerkat-b/portago/releases/download/v${pkgver}/portago_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a97571a0244832b9ed433858f06e75c6e1aa853c6e0e88472b5aae4faf273d72')

package() {
  install -Dm755 portago "${pkgdir}/usr/bin/portago"
}
