# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=2.2.0
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
sha256sums=('855d66929c6f5deba53b6d0e9c5ae8972d4df4139f32949bcd61c5ce7992209f')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
