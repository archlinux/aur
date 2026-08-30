# Maintainer: menaouer <chaabi.menaouer@gmail.com>
pkgname=einfach-grub-theme
pkgver=1.0.1
options=('!strip' '!debug')
pkgrel=1
pkgdesc="a simple grub theme to start a good day"
arch=('any')
url="https://github.com/DerMenaouer/einfach-grub-theme"
license=('GPL3')
depends=()
makedepends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('730275ae2f85263b83685e6efaf896469140b24c7325e8811121b8ce3b5f227e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/boot/grub/themes"
  # Installer Script
  ./install.sh "$pkgdir/boot/grub/themes"
}
