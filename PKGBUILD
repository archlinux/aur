# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=tokensave-bin
pkgver=7.13.0
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
  '1e90c0e2c6fbb1971b4db9662ad75adafa6ac5b3ff949a0d8591f4d8f421840e'
)
source_aarch64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-aarch64-linux.tar.gz"
)
sha256sums_aarch64=(
  '65c5532fb4f8a773dccdcf1c107da2051a7fe23a840defde310a4799de16722c'
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
