# Maintainer: tee < teeaur at duck dot com >
pkgname=picoclaw-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Ultra-Efficient AI Assistant in Go"
arch=(x86_64)
url="https://picoclaw.io"
license=(MIT)
depends=(hicolor-icon-theme)
provides=(picoclaw)
conflicts=(picoclaw)
#source=("picoclaw-$pkgver.tgz::https://github.com/sipeed/picoclaw/releases/download/v$pkgver/picoclaw_Linux_x86_64.tar.gz")
source=("picoclaw-$pkgver.deb::https://github.com/sipeed/picoclaw/releases/download/v$pkgver/picoclaw_x86_64.deb")
b2sums=('b14b44fea03ca6ef4bc02f924c773a69542732d578cc6285ff7a641a3929a5304e2a7384377e6489eed1b487da40e9daf8c6870dd0315b4f4e4ac90fcff21b2c')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
