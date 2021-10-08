# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=7
pkgrel=2
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://github.com/42LoCo42/runit-conversion"
license=('GPL')
depends=('kisslinux-init' 'runit')
optdepends=('runit-services: many service definitions')
provides=('systemd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v7.tar.gz")
sha256sums=('67b0028399f340a60462bbda7192c1007d50973e0d56b0e7f48a4195175811b1')

package() {
	cd "$pkgname-$pkgver"
	cp -a ./* "$pkgdir/"
}
