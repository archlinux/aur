# Maintainer: Pouyan Heyratpour <me@pouyan.dev>

pkgname=polywatch
pkgver=1.1.0
pkgrel=1
pkgdesc="File change watcher with filter & rate limit feature which run command(s) when file change events happen"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=()
makedepends=()
source_i686=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-386.tar.gz)
md5sums_i686=('47798a66a4718e7c543b68272c2e0140')
source_x86_64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-amd64.tar.gz)
md5sums_x86_64=('06f4a35ca68a444eb17c5ed05206029b')
source_armv7h=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-arm.tar.gz)
md5sums_armv7h=('453860966d1adff7503dfee3e3bd020d')
source_aarch64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-arm64.tar.gz)
md5sums_aarch64=('6fb9803aa43be7db6d8c971b4458e158')

package() {
  install -Dm 755 polywatch -t "${pkgdir}/usr/bin"
}