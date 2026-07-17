# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.4.5
pkgrel=1
pkgdesc='Self-hosted media vault — browse, tag, manage images and comics'
arch=('x86_64')
url='https://github.com/levpr1c/MediaVault'
license=('GPL-3.0-only')
depends=('ffmpeg')
optdepends=('gnome-keyring: encrypt API keys in system keychain')
provides=('mediavault')
conflicts=('mediavault')
source=("mediavault-v$pkgver-linux-amd64::https://github.com/levpr1c/MediaVault/releases/download/v$pkgver/mediavault-linux-amd64")
sha256sums=('e952fdf76e9716b7d0dcb804df9c1f8d3f5ad2f6ed29c77f431dbf4355c1a2a5')

package() {
  install -Dm755 "$srcdir/mediavault-v$pkgver-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
