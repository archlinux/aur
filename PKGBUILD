# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf-bin
pkgver=1.2505.7
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

sha256sums_x86_64=('54a0d1273ab8dff4f24181e8ec448527db4017f23253ed562f9c59c09ed3f0a5')
sha256sums_aarch64=('9866d83470b2fc86cf940f2d26512518214c53ea9e51df471895c658adfc43fd')

package() {
  cd "$srcdir"
  
  install -Dm755 mconf-linux-* "$pkgdir/usr/bin/mconf"
}

