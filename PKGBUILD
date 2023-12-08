# Maintainer: Pouyan Heyratpour <me@pouyan.dev>

pkgname=medad
pkgver=1.0.0
pkgrel=2
pkgdesc="Content publisher - Converts Markdown documents to HTML files and uploads them to the server"
arch=('any')
url="https://pattack.github.io/medad/"
license=('GPL3')
depends=()
makedepends=()
source_i686=(${pkgname}-${pkgver}.tar.gz::https://github.com/pattack/medad/releases/download/v${pkgver}/medad-v${pkgver}-linux-386.tar.gz)
md5sums_i686=('3bb0fd1b55728a38d16ad062942b4ce8')
source_x86_64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pattack/medad/releases/download/v${pkgver}/medad-v${pkgver}-linux-amd64.tar.gz)
md5sums_x86_64=('bd1aa0ee5f7e56e192083a9f57067a2a')
source_armv7h=(${pkgname}-${pkgver}.tar.gz::https://github.com/pattack/medad/releases/download/v${pkgver}/medad-v${pkgver}-linux-arm.tar.gz)
md5sums_armv7h=('66b731672a0a29f8041bbb3796b02b35')
source_aarch64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pattack/medad/releases/download/v${pkgver}/medad-v${pkgver}-linux-arm64.tar.gz)
md5sums_aarch64=('699373b53b735e21d6b9d69b23798f3b')

package() {
  install -Dm 755 medad -t "${pkgdir}/usr/bin"
}