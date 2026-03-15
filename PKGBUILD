# Maintainer: meerkat-b <noreply@github.com>
pkgname=portago
pkgver=0.0.1
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/portago"
license=('GPL-3.0-only')
depends=('glibc')
source=("https://github.com/meerkat-b/portago/releases/download/v${pkgver}/portago_${pkgver}_linux_amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 portago "${pkgdir}/usr/bin/portago"
}
