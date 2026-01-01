# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Secure file transfer tool with challenge-response authentication (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/VinMeld/go-send"
license=('GPL3')
depends=('glibc')
provides=("go-send")
conflicts=("go-send" "go-send-git")
source_x86_64=("$url/releases/download/v$pkgver/go-send_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/go-send_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "go-send" "$pkgdir/usr/bin/go-send"
  
  # Install license (downloaded or embedded if possible, but for binary packages often skipped or fetched separately)
  # For now, we assume the user accepts the license at the URL.
}
sha256sums_x86_64=('96ed4171e51427515f0c52d66818de6777a624f608c67b94516534bc0564f3c6')
sha256sums_aarch64=('80b7d3b684a65ca1d66699ed022d9ee5c54058dd49308d63cae59a087b4b7843')
