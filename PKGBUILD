# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=2.0.1
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
sha256sums=('43523b3cdf7c09d282cf7c877540f797448ce92763b355820105ae55a67f9885')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
