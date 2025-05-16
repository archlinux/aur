# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.2505.2
pkgrel=1
epoch=1
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
depends=()
provides=("mconf")
conflicts=("mconf")

source_x86_64=("https://github.com/marzeq/mconf/releases/download/v$pkgver/mconf-linux-amd64")
source_aarch64=("https://github.com/marzeq/mconf/releases/download/v$pkgver/mconf-linux-arm64")

sha256sums_x86_64=('03390dcd13f8062baf7ed530d643f43083b17647e467e9323cb679f49a717647')
sha256sums_aarch64=('7e7b4c504e92a93952c145bde7467dc0a28d78201fde86d10d6fa6db1c53bcf3')

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

