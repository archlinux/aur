pkgname=canary-layout-git
pkgver=35.1c694b0
pkgrel=1
pkgdesc="The Canary keyboard layout"
url="https://github.com/Apsu/Canary"
arch=("any")
license=("MIT")
source=("git+https://github.com/Apsu/Canary.git")
sha256sums=(SKIP)

pkgver() {
  cd Canary
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd Canary
  install -Dm644 canary "$pkgdir/usr/share/X11/xkb/symbols/canary"
}
