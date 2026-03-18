# Maintainer: meerkat-b <noreply@github.com>
pkgname=portago
pkgver=0.0.5
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/portago"
license=('GPL-3.0-only')
depends=('glibc')
source=("https://github.com/meerkat-b/portago/releases/download/v${pkgver}/portago_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c28b7c882116b4f8a9308d1a9ad2d017ce969e511850b338a76b916b005c2e13')

package() {
  install -Dm755 portago "${pkgdir}/usr/bin/portago"
}
