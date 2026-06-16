# Maintainer: VC365
pkgname=x11droid
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI/TUI for running and managing Waydroid instances inside Podman containers on X11."
arch=('x86_64')
url="https://github.com/thereisnotime/x11droid"
license=('GPL-3.0')
depends=('podman' 'binder_linux-dkms')
makedepends=('git')
source=("https://github.com/thereisnotime/x11droid/releases/download/v$pkgver/x11droid_"$pkgver"_linux_amd64.tar.gz")
sha256sums=('90ca6105ebb48373eda15f8b2a234f2c7dd5c3227f72a7742906f21c66b8d337')

package() {
  cd "$srcdir"
	  install -Dm755 x11droid "$pkgdir"/usr/bin/x11droid
}

