# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=5
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
source=("$pkgname-$pkgver-files.tar.xz")
sha256sums=('29df1134cc443963d52a854d5de5a739f038fcd83c6a0d20f1a0ff410186a5d2')

package() {
	cp -a files/* "$pkgdir/"
}
