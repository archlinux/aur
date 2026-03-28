# Maintainer: cantti <cantti@outlook.com>
pkgname=tagselecta-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="A vim inspired tool for managing audio file metadata (tags)"
arch=('x86_64')
url="https://cantti.github.io/tagselecta"
license=('unknown')
depends=('gcc-libs' 'glibc')
options=('!strip' '!debug')
provides=("tagselecta=${pkgver}")
conflicts=('tagselecta')
source=("${pkgname}-${pkgver}.zip::https://github.com/cantti/tagselecta/releases/download/v${pkgver}/tagselecta-linux-x64.zip")
sha256sums=('553dcd1f302ec33e387939adf40762ec2c2e689727ff7e7dac4142ae7c5f9abf')

package() {
  install -Dm755 "${srcdir}/tagselecta" "${pkgdir}/usr/bin/tagselecta"
}
