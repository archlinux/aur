pkgname=niri-autostart-bin
_pkgname=niri-autostart
pkgver=0.3.0
pkgrel=1
pkgdesc='Declarative autostart and layout restoration for the niri Wayland compositor (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/partanskiy/niri-autostart'
license=('GPL-3.0-or-later')
optdepends=('niri: run niri-autostart inside the niri compositor')
provides=('niri-autostart')
conflicts=('niri-autostart')
source_x86_64=("$_pkgname-x86_64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.3.0/niri-autostart-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-aarch64-linux.tar.gz::https://github.com/partanskiy/niri-autostart/releases/download/v0.3.0/niri-autostart-aarch64-linux.tar.gz")
sha256sums_x86_64=('cece3aa89b4d2ef770fbf55a3cae60fdd6cd24908bdcd1a5cdd18c4c30c4472e')
sha256sums_aarch64=('358c0d92b5abf625589191715e9563b7c622f5241ec09c65e56c4df0d3414076')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
