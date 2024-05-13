# Maintainer: puddings233 <puddings233@outlook.com>

pkgname=i8042-keyboard-fix
pkgver=1
pkgrel=1
pkgdesc="A (pseudo) fix for i8042 controller driver that breaks keyboard functionality on resume from suspend."
arch=('any')
url="https://github.com/mistine/i8042-keyboard-fix-linux"
source=("git+https://github.com/mistine/i8042-keyboard-fix-linux.git")
sha512sums=('SKIP')

package() {
  cd i8042-keyboard-fix-linux
  install -Dm755 keyboard-reset.sh "$pkgdir"/usr/lib/systemd/system-sleep/keyboard-reset.sh
}
