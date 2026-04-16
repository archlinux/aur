# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Rime input method init and update tool with Wanxiang, Ice, Frost, and Mint support"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/snout"
license=('MIT')
depends=()
provides=('snout')
conflicts=('snout')
source_x86_64=("snout-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-x86_64")
source_aarch64=("snout-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-aarch64")
sha256sums_x86_64=('fa1fd87231e7e05c425c0ab19509bf4e97895945d853551f9e93ef7c368f6532')
sha256sums_aarch64=('b0536470770349d18c51db34e8f5265981c9e561ba457b6a0bb3070730c93be3')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
}
