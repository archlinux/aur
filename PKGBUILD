# Maintainer: Gelmo <gelmo[at]outlook.com>

pkgname=mouselock
pkgver=1.0
pkgrel=1
pkgdesc="A very simple script to toggle xpointerbarrier on and off"
url="https://github.com/Gelmo/mouselock"
arch=('any')
license=('Unlicense')
depends=('bash' 'xpointerbarrier-fork-git')
source=("mouselock.sh")
sha256sums=('bc75d8d6cee1c2870146949b5b313f68d29fa74c0cda12f7892d9a5c4532a430')

package() {
  # Install script to /usr/bin
  install -D -m 0755 "${srcdir}/mouselock.sh" "${pkgdir}/usr/bin/mouselock"
}
