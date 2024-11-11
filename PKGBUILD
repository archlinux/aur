# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
depends=("glibc")

source_x86_64=("https://github.com/marzeq/mconf/releases/download/v$pkgver/mconf-linux-amd64")
source_aarch64=("https://github.com/marzeq/mconf/releases/download/v$pkgver/mconf-linux-arm64")

md5sums_x86_64=("0877aa88ab42b75a5463760c1ea93d55")
md5sums_aarch64=("0374e2491b9cf3a4c2ecd5b93fd8af8a")

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

