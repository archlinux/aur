# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-bin
pkgver=1.0.5
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
  install -Dm755 "go-send-linux-amd64" "$pkgdir/usr/bin/go-send"
  
  # Install license (downloaded or embedded if possible, but for binary packages often skipped or fetched separately)
  # For now, we assume the user accepts the license at the URL.
}
sha256sums_x86_64=('c68c704ce32d4a8a811fcc8e824abf6bfc8af96e4080414829e13a79b1f727ba')
sha256sums_aarch64=('ce1894df313523b674b7de86dd454cf2d2ec6d593e1ad15598c7ba6ac23964e1')
