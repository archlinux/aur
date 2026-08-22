# Maintainer: Evan Sosenko <razorx@evansosenko.com>

pkgname=t-rec-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('imagemagick')
provides=('t-rec')
conflicts=('t-rec')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/t-rec-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('94db8c41402b2ece4eb807b8673d9f3a7365cceaba83501ceb9e60bc7bc0308b')

package() {
  install -Dm755 t-rec "$pkgdir/usr/bin/t-rec"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
