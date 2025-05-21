# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.2505.5
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

sha256sums_x86_64=('b98e798f522edcc6557540f9efa11eca5bd4598717d4af09ea7354e70eb65df1')
sha256sums_aarch64=('de553877173235d64916e0bcd99db0062bcd74f0adb83fbd969db2c99fcb1ff8')

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

