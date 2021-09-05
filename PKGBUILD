# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=3
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('base-init-agnostic' 'kisslinux-init' 'runit' 'systemd-libs-fake' 'eudev')
optdepends=('runit-services: many service definitions')
source=("$pkgname-$pkgver-$pkgrel-files.tar.xz")
sha256sums=('af7cf9b3006bfeff2b243e3720965537dac1f86226848d469e4b6360a5030989')

package() {
	cp -a files/* "$pkgdir/"
}
