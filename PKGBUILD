pkgname=outertune
pkgver=1.0.0
pkgrel=1
pkgdesc="OuterTune-style YouTube Music desktop client"
arch=('x86_64')
url="https://aur.archlinux.org/packages/outertune"
license=('MIT')

depends=('webkit2gtk' 'libappindicator-gtk3' 'playerctl')
makedepends=('nodejs' 'npm' 'rust' 'cargo')

source=("outertune-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  echo "Nothing to build yet"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  echo -e '#!/bin/bash\necho "OuterTune Desktop coming soon"' > "$pkgdir/usr/bin/outertune"
  chmod +x "$pkgdir/usr/bin/outertune"
}
