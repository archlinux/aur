# Maintainer: Mahid Sheikh <mahidsheikh@proton.me>
#
# shellcheck disable=all
pkgname=phanpy-tauri
pkgver=0.1.0
pkgrel=1
pkgdesc="The Phanpy Mastodon web client, now as a Tauri app!"
arch=(x86_64)
url="https://github.com/StandingPadAnimations/phanpy-tauri/tree/production"
license=('MIT')
depends=(webkit2gtk-4.1 gtk3)
source=('https://github.com/StandingPadAnimations/phanpy-tauri/releases/download/0.1.0/phanpy-tauri.tar.gz')
sha256sums=('f03d1226c118b8cb49bb03d21cfbb07a0774945527d8572daccf65fde884579a')

package() {
  cd "$srcdir"
  bsdtar -xf phanpy-tauri.tar.gz -C "$pkgdir"
}
