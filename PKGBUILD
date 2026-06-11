# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Self-hosted media vault — browse, tag, manage images and comics'
arch=('x86_64')
url='https://github.com/levpr1c/MediaVault'
license=('MIT')
depends=('ffmpeg')
optdepends=('gnome-keyring: encrypt API keys in system keychain')
provides=('mediavault')
conflicts=('mediavault')
source=("mediavault-linux-amd64::https://github.com/levpr1c/MediaVault/releases/download/v$pkgver/mediavault-linux-amd64")
sha256sums=('acb3505155654407124108908856bf9dcd6e2ec23c2bbbdb69e0d1a0e591e6b2')

package() {
  install -Dm755 "$srcdir/mediavault-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
