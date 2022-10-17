# Maintainer: zu1k <i@zu1k.com>

pkgname=nali-go-bin
_pkgname=nali
pkgver=0.6.0
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

sha256sums_i686=('976bd218f1e6c4e66721f02187570cc8b4c4ad73c3c77d3bae885be2be5a4884')
sha256sums_x86_64=('e32f0c542d17e19224bf4a8ef6e7c49d34f7b47970a2815667a70b2cf6b572ca')
sha256sums_arm=('ab044145f669e4e50a5fbb7bd6978d2b8cc510f0e79d2eab0813ed77b6e84ab5')
sha256sums_armv7h=('48bd69200fc85384bb5439efeefece7738d34cd34dd94e3d7474013a0cbb50b7')
sha256sums_armv6h=('c3f000bd1f04619ba0786a052e451373765cca107925584ef9a63e1ce7b6d499')
sha256sums_aarch64=('f3e71489861bac20e7af7d1f4ee09eb2f68e5dfcf32784279f1a5d01330c6cbb')


package() {
  cd "$srcdir"
  install -Dm755 $_pkgname-linux-*-v$pkgver "$pkgdir"/usr/bin/$_pkgname
}
