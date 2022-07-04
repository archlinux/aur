# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.4.7
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

sha256sums_i686=('182da5d99301d84067c7c90b2c046c5aa6f3e905177fd57316b87b40b33a7064')
sha256sums_x86_64=('2eceb2848ef8341a6e872bb78be878ecbe306bf5f990af5896415609ba8812df')
sha256sums_arm=('653a88087b1d3ebcf42f6a904934ff6b5d3337cc057372586451c720e9fd97c5')
sha256sums_armv7h=('b0c09ee3cc80f417d11d7d7299af5ddaa4625a141d34a8f91087aa88ff55a96d')
sha256sums_armv6h=('8b3aac8504204cf9b4700295220e772bb9356aaa6e1c60a95828a65b2737b6d6')
sha256sums_aarch64=('326c356651232ff602cb5249e55061b688d95cffd59965ea61a20e4d2104ae0a')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
