# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.5.3
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

sha256sums_i686=('e17ff9006842fc343270839713b7f3386b361ef14659eadce6e6bda9e1d4bea2')
sha256sums_x86_64=('23abadd64340fe41250e6f50851c57352f79edc8a747a5ca2dc6bc42538aa302')
sha256sums_arm=('c082a9aaf6ce90be61e0444d872109b19daa2b6413eda58547ef6ffcced07221')
sha256sums_armv7h=('971685f434d0a06f2bf3b6a3e89941ea700c0c49b918030bd37fbc102fab96b5')
sha256sums_armv6h=('deff3d5feb53833a20a8375733a52798cc9c13cab0e745a278fe25244caa192a')
sha256sums_aarch64=('d0c06ac927efd691128eefa4307e3fca4bc07eb3f1acf40072b2b283338d09c0')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
