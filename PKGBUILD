# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.8.0
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

sha256sums_i686=('2c8d97f0e3b3997a898626dacb38316110eb17484bb6752902b7609c4351cfd9')
sha256sums_x86_64=('d5871d3268eec0322c9eaa47d7969cb8012d4744cd3579009a7c91e882df11c5')
sha256sums_arm=('899cdb8d3f328329e571fabbd510c70830cc1bccc034bb3134848c37811f1b9c')
sha256sums_armv7h=('c72c686251bd06b96b2c63109d78cfd941c11710b97d930d14fdde0865299104')
sha256sums_armv6h=('cd849ec27ca37c6cce5205b5713af16ab79ccbef8f288ec5ad8d2006bbfd5290')
sha256sums_aarch64=('ce157ca65f4577587293f6782d4b5e6e2670407bea13a2672bdb9272b2543fc8')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
