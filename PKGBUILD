# Maintainer: Lev <levpr1c@proton.me>

pkgname=mediavault-bin
pkgver=1.0.0
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
sha256sums=('2939b9aec86502697ad0eb5a34c2485ad6e38a00492b2a71d742356de38975d5')

package() {
  install -Dm755 "$srcdir/mediavault-linux-amd64" "$pkgdir/usr/bin/mediavault"
}
