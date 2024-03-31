# Maintainer: kojq <kojq@mailfence.com>

pkgname=dust-emu-bin
pkgver=0.0.0
pkgrel=1
pkgdesc='A Nintendo DS emulator written in Rust for desktop devices and the web, with debugging features and a focus on accuracy'
url=https://github.com/kelpsyberry/dust
source=(https://nightly.link/kelpsyberry/dust/workflows/build-release/main/Linux.zip)
license=(GPL-3.0)
arch=(x86_64)
conflicts=(dust-emu dust-emu-git)
provides=(dust-emu)
sha256sums=(SKIP)

prepare() {
  cd $srcdir
  tar -xf dust-desktop.tar.gz
}

package() {
  cd $srcdir
  install -Dm755 dust-desktop $pkgdir/usr/bin/dust-desktop
}
