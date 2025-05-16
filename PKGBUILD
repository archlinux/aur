# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.2505.4
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

sha256sums_x86_64=('047a4215af0af383a6dd3b792400460f22d52638a2be554806cf7c40aff0512c')
sha256sums_aarch64=('771101e2a7a283651dbd47b55ed3a89f1bc8b5854e144de5790451595a00dd5d')

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

