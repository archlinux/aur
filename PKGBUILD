# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=tokensave-bin
pkgver=7.15.0
pkgrel=1
pkgdesc='Semantic code intelligence for AI coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/aovestdipaperino/tokensave'
license=('MIT')
depends=('glibc' 'libgcc')
provides=('tokensave')
conflicts=('tokensave')
options=('!strip')
source_x86_64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-x86_64-linux.tar.gz"
)
sha256sums_x86_64=(
  '3da8d0e52da38d2b477d92e2548a68795dbda355bb274d120ee6a77f391b57a4'
)
source_aarch64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-aarch64-linux.tar.gz"
)
sha256sums_aarch64=(
  '0143e3e99c5b3a2a97790fbf50846cfb64a18a1035bf2fd63a60f511c4b7c5e2'
)
source=(
  "tokensave-license-$pkgver::https://raw.githubusercontent.com/aovestdipaperino/tokensave/v$pkgver/LICENSE"
)
sha256sums=(
  '08e7979abf9173c207753df084b5d94fa0cbe583a7cb6cbc20de5f973ee22aa0'
)

package() {
  install -Dm755 tokensave "$pkgdir/usr/bin/tokensave"
  install -Dm644 "tokensave-license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
