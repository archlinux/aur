# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.1.0
pkgver=25.1_2
local gittag="${pkgver//_/-}"
pkgrel=2
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
depends=()
provides=("mconf")
conflicts=("mconf")

source_x86_64=("https://github.com/marzeq/mconf/releases/download/v$gittag/mconf-linux-amd64")
source_aarch64=("https://github.com/marzeq/mconf/releases/download/v$gittag/mconf-linux-arm64")

md5sums_x86_64=("cacd614f0f3ba81bd2908a89910dfbab")
md5sums_aarch64=("345918bc3cba5825610a151df35c9982")

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

