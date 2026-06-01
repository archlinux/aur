# Maintainer: tee < teeaur at duck dot com >
pkgname=neohtop-cli-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="A cross-platform terminal process monitor with btop-style visualizations"
arch=(x86_64)
url="https://github.com/Abdenasser/neohtop-cli"
license=(MIT)
source=("$pkgname-$arch-$pkgver.tar.gz::$url/releases/download/v$pkgver/neohtop-cli-linux-amd64.tar.gz")
b2sums=('9c441fec6439ecde37098894d720979b1925216b4c93dd834e81bd9a0e453e8f36f4a7f6c6b716f8a3f872b9aad9466b9dd738af988aa9f049927ab5398c458a')

package() {
  install -Dm755 neohtop-cli-linux-amd64 "$pkgdir/usr/bin/neohtop"
}
