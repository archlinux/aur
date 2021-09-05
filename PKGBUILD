# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=2
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('base-init-agnostic' 'kisslinux-init' 'runit' 'systemd-libs-fake' 'eudev')
optdepends=('runit-services: many service definitions')
source=("$pkgname-$pkgver-$pkgrel-files.tar.xz")
sha256sums=('def98567381a9ef2ba619002127b5fb826ae2b3657e4ebf19c4b37caefd14e46')

package() {
	cp -a files/* "$pkgdir/"
}
