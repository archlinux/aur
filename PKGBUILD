# Maintainer: Vinay <vinaymeldrum@gmail.com>
pkgname=go-send-bin
pkgver=2.1.0
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
sha256sums_x86_64=('43addc7668c78e39cceec9b57a22c7b2ba73f188a1af959a70b7a9655ce9def1')
sha256sums_aarch64=('6cae52f59fa42fbee38693d4255e5f29eb0c4975af45265d35d81b35c736379c')
