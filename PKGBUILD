# Maintainer: Pouyan Heyratpour <me@pouyan.dev>

pkgname=polywatch
pkgver=1.2.0
pkgrel=1
pkgdesc="File change watcher with filter & rate limit feature which run command(s) when file change events happen"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=()
makedepends=()
source_i686=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-386.tar.gz)
md5sums_i686=('cf0f7ade8ae3346442f8ee0c7dd11908')
source_x86_64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-amd64.tar.gz)
md5sums_x86_64=('ea6401e7178798420b137bd0093ecdfe')
source_armv7h=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-arm.tar.gz)
md5sums_armv7h=('33f367479b14cee15dfd9c89007896e5')
source_aarch64=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/releases/download/v${pkgver}/polywatch-v${pkgver}-linux-arm64.tar.gz)
md5sums_aarch64=('bfb522248f93cf6b3de53859d8f33ec1')

package() {
  install -Dm 755 polywatch -t "${pkgdir}/usr/bin"
}
