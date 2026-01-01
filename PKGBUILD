# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Secure file transfer tool with challenge-response authentication (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/VinMeld/go-send"
license=('GPL3')
depends=('glibc')
provides=("go-send")
conflicts=("go-send" "go-send-git")
source_x86_64=("$url/releases/download/v$pkgver/go-send-linux-amd64")
source_aarch64=("$url/releases/download/v$pkgver/go-send-linux-arm64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "go-send-linux-amd64" "$pkgdir/usr/bin/go-send"
  
  # Install license (downloaded or embedded if possible, but for binary packages often skipped or fetched separately)
  # For now, we assume the user accepts the license at the URL.
}
