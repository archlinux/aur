# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=7
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
provides=('systemd')
source=("$pkgname-$pkgver-files.tar.xz")
sha256sums=('dc5ff3f54ddc9a46180de047775e81212eb1f6a9bd8a612d3f9bfae7b8d3af09')

package() {
	cp -a files/* "$pkgdir/"
}
