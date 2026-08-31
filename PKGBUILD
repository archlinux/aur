pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.3.1
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.3.1/niri-autostart-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.3.1/niri-autostart-aarch64-linux.tar.gz")
sha256sums_x86_64=('aabf65d505f85b903b62b5aebb3cd11bde1a154a63f1718003dc0f9908d950fe')
sha256sums_aarch64=('5b2987a8045778950169bdb59f5d27ca40e63e117f0bdbdcfd7e30483d8a0e95')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
