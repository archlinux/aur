# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A vim inspired tool for managing audio file metadata (tags)"
arch=('x86_64')
url="https://cantti.github.io/tagselecta"
license=('unknown')
depends=('gcc-libs' 'glibc')
options=('!strip' '!debug')
provides=("tagselecta=${pkgver}")
conflicts=('tagselecta')
source=("${pkgname}-${pkgver}.zip::https://github.com/cantti/tagselecta/releases/download/v${pkgver}/tagselecta-linux-x64.zip")
sha256sums=('193737be22ade0c49ea93e532f90ca88ff3192aae21e003c7ec2cdc6b55e3866')
package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
