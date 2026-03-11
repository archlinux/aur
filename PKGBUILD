pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.1.0
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-linux.tar.gz")
sha256sums_x86_64=('10401902a634d2208d2bbeafea83dc7aa6ecb58d546f085f255c618c98a95cc1')
sha256sums_aarch64=('72b7a37581858573f1e1d5308c203bd5abc7354a1596a9fdda85528d168fa23d')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
