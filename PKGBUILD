# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=6
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
source=("$pkgname-$pkgver-files.tar.xz")
sha256sums=('45175b18e86d7d1bde0c7e1978c9b18b5b0bf298d9b3d3a47bbeff8171698cec')

package() {
	cp -a files/* "$pkgdir/"
}
