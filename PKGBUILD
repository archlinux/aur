# Maintainer: Mohammad Yousaf https://fyiimysf.is-a.dev
pkgname=posd
pkgver=1.0
pkgrel=1
arch=(x86_64)
url='https://codeberg.org/fyiimysf/pOSD.git'
pkgdesc="pOSD aka project OSD is a GTK4 based OSD for Volume, Brightness, and Lock-keys"
license=(GPL LGPL FDL)
groups=()
depends=(wireplumber gtk4)
source=("https://codeberg.org/fyiimysf/pOSD.git")
sha256sums=(SKIP)


build() {
  git clone "${source[0]}"
  cd pOSD
  make
}

package() {
  cd pOSD
  make DESTDIR="$pkgdir" install
}
