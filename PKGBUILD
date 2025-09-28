# Maintainer: Pablo Cendrero <pabloagujeronegro2013@gmail.com>
pkgname=lock-config
pkgver=1.0
pkgrel=3
pkgdesc="i3lock-color configuration, launch with lock command"
arch=('any')
url="https://aur.archlinux.org/"
license=('GPL')
depends=('i3lock-color')
source=('https://raw.githubusercontent.com/PablCendrero8310/lock/refs/heads/main/lock')
sha256sums=('4d7ffa2d6088d77542c1537a07330566e1e5dcaaad35a28a45949a0af44fbd94')

package() {
  # Instalar el servicio systemd

  # Instalar el wrapper
  install -Dm755 "$srcdir/lock" \
    "$pkgdir/usr/bin/lock"
}
