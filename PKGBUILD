# Maintainer: meerkat-b <noreply@github.com>
pkgname=burrow
pkgver=0.0.6
pkgrel=1
pkgdesc="Portable, single-binary Go IDE built on Neovim"
arch=('x86_64')
url="https://github.com/meerkat-b/burrow"
license=('GPL-3.0-only')
depends=('go' 'gcc' 'git')
source=("https://github.com/meerkat-b/burrow/releases/download/v${pkgver}/burrow_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2d5158905df1a4af9633e57f4b9c4cd1dbc89feff8f2956233ac70ae95593f18')

package() {
  install -Dm755 burrow "${pkgdir}/usr/bin/burrow"
}
