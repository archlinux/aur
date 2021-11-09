# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=8
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://github.com/42LoCo42/runit-conversion"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
conflicts=('systemd-sysvcompat')
provides=('systemd-sysvcompat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v8.tar.gz")
sha256sums=('92449e629751a8a9f1828b4c1c3676531f88bb16f8310bcb5b2b147e4defe83a')

package() {
	cd "$pkgname-$pkgver"
	cp -aP ./* "$pkgdir/"
}
