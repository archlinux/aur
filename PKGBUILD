# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
conflicts=('tut')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')

source_x86_64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-amd64-static")
source_i686=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-386-static")
source_arm=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-armv5-static")
source_armv6h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-armv6-static")
source_armv7h=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-armv7-static")
source_aarch64=("$pkgname-$pkgver-bin::https://github.com/RasmusLindroth/tut/releases/download/1.0.9/tut-arm64-static")

sha256sums_x86_64=('1e6acccd237ab05aa20909a330245173878ae230ddb4c486577f1862607b1c18')
sha256sums_i686=('896f764ad009694e5b8f254542c049dc80f64d5ad263ec2a59f58795c8519e08')
sha256sums_arm=('f6659a5e6e7dffcb01fc9d64c8e8730f5261f96d0fc30cb7795bf6d07a50e9a1')
sha256sums_armv6h=('955fdd0d6e8750f700dc7844d7fb987c369625f22f59c757269007f763dcb03e')
sha256sums_armv7h=('4c09f6c930cef832c67099e50ed2d8b9981be30098cee7a729672b72944c0d08')
sha256sums_aarch64=('1203b7c464fe640c0f00f8fe75422a6519129ba554014b5723f555ff4a5b6950')

package() {
  install -Dm755 $pkgname-$pkgver-bin "$pkgdir"/usr/bin/$_pkgname
}
