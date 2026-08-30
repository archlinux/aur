# Maintainer: menaouer <chaabi.menaouer@gmail.com>
pkgname=einfach-icon-theme
pkgver=1.0.0
options=('!strip' '!debug')
pkgrel=1
pkgdesc="Simple GTK icon theme with multiple color variants"
arch=('any')
url="https://github.com/DerMenaouer/einfach-icon-theme"
license=('CC BY-SA 4.0')
depends=()
makedepends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84f2401b8fa4e97ee125daf4131161e4ccff367802019778494db3692d831974')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Installer Script
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
