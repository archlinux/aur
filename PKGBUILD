# Maintainer: Pranav Jerry <libreinator@disroot.org>

# PKGBUILD based on ttf-roboto commit f2e1a93d5b16b0c34048bb975b9b9ba70a2c184b

pkgname=ttf-funkwest
pkgver=1.0
pkgrel=1
pkgdesc="funkwest font by theo"
url='https://github.com/theoisdumb/funkwest'
arch=('any')
license=('MIT')
makedepends=("git")
source=("git+${url}.git#commit=85b5ef265426ef522394274ed84195696e85d4f4")
sha256sums=('SKIP')

package() {
  cd funkwest
  install -Dm644 funkwest.ttf -t "$pkgdir"/usr/share/fonts/TTF
}
