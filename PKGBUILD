# Maintainer: Justine <solitary.echoes369@gmail.com>
pkgname=focusx
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful Pomodoro Timer for the terminal, optimized for Arch Linux"
arch=('any')
url="https://github.com/Justine01231/focusX"
license=('MIT')
depends=('bash' 'go' 'libnotify')  # add 'lolcat' 'speech-dispatcher' if needed
source=("focusx.sh")
md5sums=('SKIP')  # Use 'SKIP' for local scripts or update with actual checksum

package() {
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
