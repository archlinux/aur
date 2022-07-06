# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.4.8
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

sha256sums_i686=('9d174d3d2762be6a90f015edf2c399b7f9928d0031f5ed73b634c5f048e38765')
sha256sums_x86_64=('d58a210e9ca4c1c0206a6337b672412226504a5881fcd87d723a2ef6314ca052')
sha256sums_arm=('40a43ab49c572a4a34c0f27f0f447367bf1406dcc55c2321b4b978f58ed9df1c')
sha256sums_armv7h=('6103f63715fd52ed98b35dc41906ddf8862373eecd70ad98447615bfd3c8851b')
sha256sums_armv6h=('1fa80a9fe61d51a7dfd4ea33c6e555dc134eaaade1f45efd1797d07fc7bfb1fc')
sha256sums_aarch64=('00500e187abb7aacb97dc2a45b5d1ac66553ccf1f604263592142fdce8e4176f')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
