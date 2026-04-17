# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Vim-inspired tool for managing audio file metadata"
arch=('x86_64')
url="https://cantti.github.io/tagselecta"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
options=('!strip' '!debug')
provides=("tagselecta=${pkgver}")
conflicts=('tagselecta')
source=("${pkgname}-${pkgver}.zip::https://github.com/cantti/tagselecta/releases/download/v${pkgver}/tagselecta-linux-x64.zip")
sha256sums=('447ce4d6559d139a2dd08ea1bea93c2daa437a0cf7f5d32597362cc203cdd760')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
