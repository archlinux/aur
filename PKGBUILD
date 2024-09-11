# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=binsider-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Analyze ELF binaries like a boss 😼🕵️‍♂️ (binary release)"
url="https://github.com/orhun/binsider"
license=('Apache-2.0' 'MIT')
arch=('x86_64')
depends=('gcc-libs')
provides=("binsider")
conflicts=("binsider")
source=("$url/releases/download/v$pkgver/binsider-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('74eceb1d92721222f07f61a1f1a7b482d2e1f3811efbee5d6425277d7ea46e3a')

package() {
  cd binsider-$pkgver
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/binsider"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/binsider"
  install -Dm755 binsider -t "$pkgdir/usr/bin"
}
