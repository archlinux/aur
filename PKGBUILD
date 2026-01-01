# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-bin
pkgver=1.0.6
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
sha256sums_x86_64=('09d9a218db141ac6811d9bc816b81a6ed6aea2a6a25e47b4f00e673e45366157')
sha256sums_aarch64=('4eb019c8d7349a15257119752a8cb96163baf5868700e162d947635721c74a6d')
