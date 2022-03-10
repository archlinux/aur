# Maintainer: Aakash Sen Sharma <aakashsensharma@gmail.com>
pkgname=wayshot-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A screenshot tool for wlroots compositors."
url="https://github.com/waycrate/wayshot"
license=('BSD')
arch=('x86_64')
optdepends=('slurp: for area selection')
provides=('wayshot-bin')
conflicts=('wayshot-git' 'wayshot-musl-git')
source=("wayshot::$url/releases/download/$pkgver/wayshot")
sha256sums=('SKIP')

package() {
	install -Dm 755 wayshot "$pkgdir/usr/bin/wayshot"
}

