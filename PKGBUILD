pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.2.0
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.2.0/niri-autostart-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.2.0/niri-autostart-aarch64-linux.tar.gz")
sha256sums_x86_64=('8703583d014cf4f4a9de99b37962bc50f8d6b39fd9efceb50a9ad71dbc0d5163')
sha256sums_aarch64=('c2ff04a8060975e4b5e682dab44527f4cfdfb045734c3df429ec0d680b8b6380')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
