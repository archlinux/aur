# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=8.1
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://github.com/42LoCo42/runit-conversion"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
conflicts=('systemd-sysvcompat')
provides=('systemd-sysvcompat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18cc81cd3e0c8283f4044731990373b0f800881c9160a50951c58301996a3d06')

package() {
	cd "$pkgname-$pkgver"
	cp -aP ./* "$pkgdir/"
}
