# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=9
pkgrel=3
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://github.com/42LoCo42/runit-conversion"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
conflicts=('systemd-sysvcompat')
provides=('systemd-sysvcompat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d112763dad55c1d1284593d1727c383d41f4e122264a325421702437f35cccdd')

package() {
	cd "$pkgname-$pkgver"
	cp -aP ./* "$pkgdir/"
}
