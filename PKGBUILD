# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Self-hosted media vault — browse, tag, manage images and comics'
arch=('x86_64')
url='https://github.com/levpr1c/MediaVault'
license=('MIT')
depends=('ffmpeg')
optdepends=('gnome-keyring: encrypt API keys in system keychain')
provides=('mediavault')
conflicts=('mediavault')
source=("mediavault-v$pkgver-linux-amd64::https://github.com/levpr1c/MediaVault/releases/download/v$pkgver/mediavault-linux-amd64")
sha256sums=('6ac83b66d6ed72be4c19ea39892215f287f40fbbdc5065076d74996ebe5a851c')

package() {
  install -Dm755 "$srcdir/mediavault-v$pkgver-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
