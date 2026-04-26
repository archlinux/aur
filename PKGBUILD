pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.1.12
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.1.12/niri-autostart-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.1.12/niri-autostart-aarch64-linux.tar.gz")
sha256sums_x86_64=('97ca0c4a5d8c1df7381c11d54c60512a09514bbde6ebc9bc5586b4b7889f8647')
sha256sums_aarch64=('20465152d17c280fb8b9d1c70fad5abf430f212da556c68a8b452584508f9458')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
