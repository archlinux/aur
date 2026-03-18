# Maintainer: meerkat-b <noreply@github.com>
pkgname=burrow
pkgver=0.0.1
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/burrow"
license=('GPL-3.0-only')
depends=('go' 'gcc' 'git')
source=("https://github.com/meerkat-b/burrow/releases/download/v${pkgver}/burrow_${pkgver}_linux_amd64.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 burrow "${pkgdir}/usr/bin/burrow"
}
