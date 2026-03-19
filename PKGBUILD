# Maintainer: meerkat-b <noreply@github.com>
pkgname=burrow
pkgver=0.0.7
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/burrow"
license=('GPL-3.0-only')
depends=('go' 'gcc' 'git')
source=("https://github.com/meerkat-b/burrow/releases/download/v${pkgver}/burrow_${pkgver}_linux_amd64.tar.gz")
sha256sums=('e60218fc487d7ec76f96f872cce993f8d7c4dc5ef25c7536d335cd6a30f8505d')

package() {
  install -Dm755 burrow "${pkgdir}/usr/bin/burrow"
}
