# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=2.6.0
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
sha256sums=('de5866e8dc866bd46467631a0e5971167e607c782baf6254b38fb7a99983b5e2')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
