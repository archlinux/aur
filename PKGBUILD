# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=4
pkgrel=2
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('base-init-agnostic' 'kisslinux-init' 'runit' 'systemd-libs-fake' 'eudev')
optdepends=('runit-services: many service definitions')
provides=('systemd-sysvcompat')
conflicts=('systemd-sysvcompat')
source=("$pkgname-$pkgver-files.tar.xz")
sha256sums=('20417409cb256b3c61ed582c717d94df703b6fc54378709b50dad665478259a3')

package() {
	cp -a files/* "$pkgdir/"
}
