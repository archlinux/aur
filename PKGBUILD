# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=3.0.1
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
sha256sums=('76e85bcbfe9c78af9cc99db78b31782ef1dfc7d9c49d6ee3c37371b35d4b8bcc')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
