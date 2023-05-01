# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.7.3
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

sha256sums_i686=('8265f8c686e54ef7fd5b4e6f93a98ac19cf3bd8b708e399ff57a53950d529984')
sha256sums_x86_64=('d3279b39995711b4a4ea56f51a00e2be9b3e49e8743c4e53ccc88f1239da3c9b')
sha256sums_arm=('9a14dcd7916f07d2b87c902b6818c638d5fefb94f20542502aa3baf091956c2a')
sha256sums_armv7h=('9dc0a86b7bfef9eda5ad12e8a7d90626e1fb96f35c2f7b0d40c56c2cd3296f7c')
sha256sums_armv6h=('304c54172663c5d2dec59622d378985e7d010c1a7f0363923503e36d434367ab')
sha256sums_aarch64=('8b8103c753d195006475826a6bc26f90482575a2c6016e78db1de55edd5051d8')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
