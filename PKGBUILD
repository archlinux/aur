# aur/PKGBUILD
pkgname=toney
pkgver=2.1.1
pkgrel=1
pkgdesc="Fast, lightweight, terminal-based note-taking app for the modern developer."
arch=('x86_64')
url="https://github.com/SourcewareLab/Toney"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/SourcewareLab/Toney/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
  cd "Toney-$pkgver"
  go build -o toney 
}

package() {
  cd "Toney-$pkgver"
  install -Dm755 "toney" "$pkgdir/usr/bin/toney"
}

