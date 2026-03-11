pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.1.10
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.1.10/niri-autostart-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.1.10/niri-autostart-aarch64-linux.tar.gz")
sha256sums_x86_64=('2b5eaf7a55250d0d49a5ccf969e710b12f7769fe0f954bad3dd6d2c0e42a7b84')
sha256sums_aarch64=('caa505c2c75248a5dd7467898960418c9ecde11d284e3e9a93649e32982c0570')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
