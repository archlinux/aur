# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.7.1
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

sha256sums_i686=('c2f1e0f9cae1bce3dbe704600166fd6061f856b7d114b060546cf907577e366e')
sha256sums_x86_64=('e3266de5bee00b56d56bb9b3b9f74bc1a841ff0ad1482915e8bc78cf1e2276c2')
sha256sums_arm=('c7f29ea05507800872ae251496c3ec158ce4e9d4934bad71822a19aeb350d7cf')
sha256sums_armv7h=('e04ee3e5308a9b5cbe39c005211f2f850953a462678d981d10c8c97dfc977dcf')
sha256sums_armv6h=('11c2ce92537a3b0211d89b5f708bd26ef823af40c83c3efa6b18f3f2bb304709')
sha256sums_aarch64=('c141f61be1a612c0237b8c2f6624a0600479b54d1cc17e9e264567c48e6842af')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
