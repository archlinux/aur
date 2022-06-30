# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.4.5
pkgrel=1
pkgdesc='An offline tool for querying IP geographic information and CDN provider. (Pre-compiled)'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zu1k/nali"
license=('MIT')
provides=('nali')
conflicts=('nali')

source_i686=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-386-v$pkgver.gz")
source_x86_64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-amd64-v$pkgver.gz")
source_aarch64=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv8-v$pkgver.gz")
source_armv6h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv6-v$pkgver.gz")
source_armv7h=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv7-v$pkgver.gz")
source_arm=("https://github.com/zu1k/nali/releases/download/v${pkgver}/$_pkgname-linux-armv5-v$pkgver.gz")

sha256sums_i686=('a9977e18853d0c9bf0f9f06acaa55714e99a234ed10b75a3e9523570b6aad5f1')
sha256sums_x86_64=('337465ec14e6f5a122f45fcece95c9445817cb7bb9bf4934cae84203ecf71162')
sha256sums_arm=('ef222f56d635ad486c8dc9a9b375dcb5d5353cbac9c0f77f524bacc4cdb05259')
sha256sums_armv7h=('29fd83a72e6d6a49ea15577c4f1bd8e2663a6b45ea8ffcf2b42505dce6a18702')
sha256sums_armv6h=('174e6bc7e6be247637f0519288e6b82fbd6d6f2a37e4edbd686cb2934a2f6e79')
sha256sums_aarch64=('a2024f86a272c083604e2257be1ffc38553506dc54dd49fbc5476ed0356173cd')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
