# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=tokensave-bin
pkgver=7.12.1
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
  '184612db16800e384a1bcdc7fadcc53fa73bda70240f9c0416ac4b88c7e924fb'
)
source_aarch64=(
  "https://github.com/aovestdipaperino/tokensave/releases/download/v$pkgver/tokensave-v$pkgver-aarch64-linux.tar.gz"
)
sha256sums_aarch64=(
  '7de5c95b51d508f39a83d9420ad0700502de107a61dbb38dad3d008d4f6f4261'
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
