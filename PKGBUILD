# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.0.2
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
sha256sums=('e3b7532fa28795a4599304d6396f823425859f2e741d73340ac5dffad74ebb6b')

package() {
  install -Dm755 "$srcdir/mediavault-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
