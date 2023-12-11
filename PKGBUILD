# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.8.1
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

sha256sums_i686=('7990c7b68719bb143e4f81ff596b3cacc25a0ce1087b8505fbab2b6203c49519')
sha256sums_x86_64=('aaacda97a18d19678eb549b89b285adfe9eeddbb829e925ce92c7e41850fbc78')
sha256sums_arm=('c06da19621c83e1d27caf346bfec24d71675a7c2bddd9a1c340fd251fa889f85')
sha256sums_armv7h=('4ec8115167a48ac36319b255bfd24c6bc499928093d6129435e32ea52724d56f')
sha256sums_armv6h=('b9b10d8fa7b4d79a2ffc2edfa586510585fbc216447a9e25ecdc3e67504e0397')
sha256sums_aarch64=('ea28a481de825f86f8fa3d77dc0b91fccede99020511b7b2e3aca124beacb764')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
