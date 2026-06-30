# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.4.0
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
sha256sums=('53416d5bba67096f8106e3dae0978846c9b6aac107dd893a98e572fa0fdcfadb')

package() {
  install -Dm755 "$srcdir/mediavault-v$pkgver-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
