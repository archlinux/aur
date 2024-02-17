# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell

pkgname=('nwg-shell-wallpapers')
pkgver=1.5
pkgrel=1
pkgdesc="nwg-shell wallpapers package"
arch=('any')
url="https://github.com/nwg-piotr/nwg-shell-wallpapers"
license=('CC0-1.0')
provides=('nwg-shell-wallpapers')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell-wallpapers/archive/v"$pkgver".tar.gz")

md5sums=('35f580b5ac0c2921e0d47332dbbb6943')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "$pkgdir"/usr/share/backgrounds/nwg-shell

  install -D -t "$pkgdir"/usr/share/backgrounds/nwg-shell wallpapers/*
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
