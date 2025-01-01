# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.1.0
pkgver=24.1_1
local gittag="${pkgver//_/-}"
pkgrel=2
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
depends=("glibc")
provides=("mconf")
conflicts=("mconf")

source_x86_64=("https://github.com/marzeq/mconf/releases/download/v$gittag/mconf-linux-amd64")
source_aarch64=("https://github.com/marzeq/mconf/releases/download/v$gittag/mconf-linux-arm64")

md5sums_x86_64=("45661c2244de0249732c87bfe0784840")
md5sums_aarch64=("f0953a518a3b736ce5512546f65e1daa")

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

